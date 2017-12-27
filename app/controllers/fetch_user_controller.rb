class FetchUserController < ApplicationController
  before_action  :authenticate_request!

  def show
    render json: {consumer_id: @current_user.id, consumer_name: @current_user.name, consumer_email: @current_user.email}
  end
end
