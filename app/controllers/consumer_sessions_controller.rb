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
    auth_token: JsonWebToken.encode({user_id: consumer.id}),
    consumer: {consumer_id: consumer.id, consumer_name: consumer.name, consumer_email: consumer.email}
  }
end

end
