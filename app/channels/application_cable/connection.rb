module ApplicationCable
  class Connection < ActionCable::Connection::Base
    require 'json_web_token'
    identified_by :current_user

    def connect
     self.current_user = find_verfied_user
    end

    protected

    def session_info
      JsonWebToken.decode(request.params[:token])
    end

    def find_verfied_user
     if session_info[:consumer_id]
       current_user = Consumer.find(session_info[:consumer_id])
     elsif session_info[:vendor_id]
       current_user = Vendor.find(session_info[:vendor_id])
     else
       reject_unauthorized_connection
     end
    end
  end
end
