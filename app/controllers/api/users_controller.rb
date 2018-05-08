module Api
  class UsersController < ApplicationController
    load_and_authorize_resource class: "User"

    def index
      users = @users.order('id DESC');
      render json: { items: users }
    end

    def show
      render json: { item: @user }
    end

    def create
      if @user.save
        render json: { item: @user }, status: 201
      else
        render json: { errors: @user.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      render json: { item: @user }, status: :ok
    end

    def update
      if @user.update_attributes(user_params)
        render json: { item: @user }
      else
        render json: { errors: @user.errors }, status: :unprocessable_entity
      end
    end

  private

    def user_params
      params.permit(:email, :password)
    end
  end
end
