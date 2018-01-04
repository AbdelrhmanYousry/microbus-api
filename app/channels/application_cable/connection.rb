module ApplicationCable
  class Connection < ActionCable::Connection::Base
 # This prevents consumers from connecting to the websockets without a consumer account logged in.
  	identified_by :current_consumer

  	  def connect
  	    self.current_consumer = find_verfied_consumer
  	  end

  	  private
		# env['warden'] check https://github.com/hassox/warden/wiki/Users
  	  def find_verfied_user
  	    if current_consumer = env['warden'].consumer
  	      current_consumer
  	    else
  	      reject_unauthorized_connection
  	    end
  	  end
  end
end
