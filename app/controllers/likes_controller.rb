class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @like = Like.create(article: @article, user: current_user)
      respond_to do |format|
        format.js
        format.html { redirect_to article_path(@article) }
      end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = Like.find_by(article: @article, user: current_user)
    @like.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to article_path(@article) }
      end
  end
end
