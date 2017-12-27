class ApplicationController < ActionController::API
  require 'json_web_token'
  def authenticate_request!
    #unless user_present?
    if !current_user.present?
      render json: { message: 'You must be authenticated first'}, status: :unauthorized
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { message: 'You must relog'}, status: :unauthorized
  end

  private
  def jwt_token
    #@payload_token || = if request.headers['Authentication-Token'].present?
                         #request.headers['Authentication-Token'].split('.').last
                       #end
      @jwt_token ||= request.headers['Authentication-Token']

  end

  def session_info
    @session_info ||= JsonWebToken.decode(jwt_token)
  end

  def current_user
    @current_user ||= Consumer.find session_info[:user_id]
  rescue ActiveRecord::RecordNotFound
    nil
  end

end
