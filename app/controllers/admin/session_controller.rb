module Admin
  class SessionController < ApplicationController
    def new
    end

    def create
      email, password = session_params.values_at(:email, :password)
      user = User.find_by_email(email)
      if user.blank? || user.password != User.hash_password(password)
        render :new
        return
      end

      session[:token] = JWT.encode({ user_id: user.id }, Rails.application.secrets.jwt_secret, 'HS256')
      redirect_to admin_root_path
    end

    def destroy
      session[:token] = nil
      redirect_to login_path
    end

  private
    def session_params
      params.permit(:email, :password)
    end
  end
end
