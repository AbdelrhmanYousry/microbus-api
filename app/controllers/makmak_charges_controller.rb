class MakmakChargesController < ApplicationController
  before_action :authenticate_request!
  def charge
    @current_user.charge(params[:amount])
    if @current_user.save
      render json: @current_user.current_balance
    else
      render json: {message: "failed"}, status: :unauthorized
    end
  end
end
