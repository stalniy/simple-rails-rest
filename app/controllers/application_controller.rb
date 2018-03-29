require 'jwt'

class ApplicationController < ActionController::API
  def current_user
    if token
      @current_user ||= User.find(token["user_id"])
    else
      @current_user ||= User.new(role: "visitor")
    end
  end

private
  def token
    return unless headers["Authorization"]
    @token ||= JWT.decode headers["Authorization"], Rails.application.secrets.jwt_secret, true, { algorithm: 'HS256' }
  end
end
