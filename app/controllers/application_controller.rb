class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception.message }, status: 403
  end

  def current_user
    if token
      @current_user ||= User.find(token["user_id"])
    else
      @current_user ||= User.new(role: "visitor")
    end
  end

  def authenticate_admin_user!
    redirect_to login_path unless current_user.nil?
  end

private
  def token
    value = request.headers["Authorization"] || session[:token]
    return if value.blank?
    @token ||= JWT.decode(value, Rails.application.secrets.jwt_secret, true, { algorithm: 'HS256' }).first
  end
end
