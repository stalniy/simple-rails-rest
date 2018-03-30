module Api
  class SessionController < ApplicationController
    def create
      email, password = session_params.values_at(:email, :password)
      user = User.find_by_email(email)

      return render json: { message: "Invalid email or password" }, status: 400 if user.blank? || user.password != User.hash_password(password)

      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.jwt_secret, 'HS256')
      render json: { token: token, rules: Ability.new(user).to_list }
    end

  private
    def session_params
      params.permit(:email, :password)
    end
  end
end
