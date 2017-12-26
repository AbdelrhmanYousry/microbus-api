class ConsumerSessionsController < ApplicationController
  def login
  consumer = Consumer.find_by(email: params[:email])

  if consumer && consumer.authenticate(params[:password])
    # auth_token = JsonWebToken.encode({consumer_id: consumer.id})
    # render json: {auth_token: auth_token}, status: :ok
    render json: {message: 'login successful' } , status: :ok
  else
    render json: {error: 'Invalid username / password'}, status: :unauthorized
  end
end
end
