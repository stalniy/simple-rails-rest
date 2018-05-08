module Api
  class ArticlesController < ApplicationController
    load_and_authorize_resource class: "Article"

    def index
      articles = @articles.order('id DESC')
      render json: { items: articles }
    end

    def show
      render json: { item: @article }
    end

    def create
      if @article.save
        render json: { item: @article }, status: 201
      else
        render json: { errors: @article.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      @article.destroy
      render json: { item: item }, status: :ok
    end

    def update
      if @article.update_attributes(article_params)
        render json: { item: @article }
      else
        render json: { errors: @article.errors },status: :unprocessable_entity
      end
    end

  private

    def article_params
      params.permit(:title, :body)
    end
  end
end
