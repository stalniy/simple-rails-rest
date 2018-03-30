module Api
  class ArticlesController < ApplicationController
    load_and_authorize_resource class: "Article"

    def index
      articles = Article.order('id DESC');
      render json: { items: articles }
    end

    def show
      article = Article.find(params[:id])
      render json: { item: article }
    end

    def create
      article = Article.new(article_params)

      if article.save
        render json: { item: article }, status: 201
      else
        render json: { errors: article.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      article = Article.find(params[:id])
      article.destroy
      render json: { item: item }, status: :ok
    end

    def update
      article = Article.find(params[:id])
      if article.update_attributes(article_params)
        render json: { item: article }
      else
        render json: { errors: article.errors },status: :unprocessable_entity
      end
    end

  private

    def article_params
      params.permit(:title, :body)
    end
  end
end
