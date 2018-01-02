  class ConsumerRegistrationsController < ApplicationController
  def create
    consumer = Consumer.new(consumer_params)

    if consumer.save
      render json: {status: 'consumer created successfully'}, status: :created
    else
      render json: { errors: consumer.errors.full_messages }, status: :bad_request
    end
  end

private

def consumer_params
  params.require(:consumer).permit(:name, :email, :password, :password_confirmation)
end

end
