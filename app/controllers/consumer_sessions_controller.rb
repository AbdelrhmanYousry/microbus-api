class ConsumerSessionsController < ApplicationController

  def login
  consumer = Consumer.find_by(email: params[:email])

      if consumer && consumer.authenticate(params[:password])
        render json: response_obj(consumer), status: :ok
        # render json: {message: 'login successful' } , status: :ok
      else
        render json: {error: 'Invalid username / password'}, status: :unauthorized
      end
    end

    private
def response_obj(consumer)
  {
    auth_token: JsonWebToken.encode({consumer_id: consumer.id}),
    user: {user_id: consumer.id, user_name: consumer.name, user_email: consumer.email, user_type: 'consumer'}
  }
end

end
