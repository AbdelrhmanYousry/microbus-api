class FetchUserController < ApplicationController
  before_action  :session_info_check!

  def show
    if current_user.present?
      render json: {user_id: @current_user.id, user_name: @current_user.name, user_email: @current_user.email, user_type: 'consumer'}
    elsif current_vendor.present?
      render json: {user_id: @current_vendor.id, user_name: @current_vendor.name, user_email: @current_vendor.email, user_type: 'vendor'}
    else
      render json: {message: 'not logged in'}, status: :unauthorized
    end
  end

end
