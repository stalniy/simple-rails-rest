module Api
  class UsersController < ApplicationController
    load_and_authorize_resource class: "User"

    def index
      users = User.order('id DESC');
      render json: { items: users }
    end

    def show
      user = User.find(params[:id])
      render json: { item: user }
    end

    def create
      user = User.new(user_params)

      if User.save
        render json: { item: user }, status: 201
      else
        render json: { errors: User.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      user = User.find(params[:id])
      User.destroy
      render json: { item: item }, status: :ok
    end

    def update
      user = User.find(params[:id])
      if User.update_attributes(user_params)
        render json: { item: user }
      else
        render json: { errors: User.errors }, status: :unprocessable_entity
      end
    end

  private

    def user_params
      params.permit(:email, :password)
    end
  end
end
