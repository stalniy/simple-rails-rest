class ApplicationController < ActionController::API
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

private
  def token
    value = request.headers["Authorization"]
    return unless value
    @token ||= JWT.decode(value, Rails.application.secrets.jwt_secret, true, { algorithm: 'HS256' }).first
  end
end
