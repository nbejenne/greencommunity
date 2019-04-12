class My::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = current_user.articles
  end

  def show
    @comments = @article.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @article.update!(article_params)
      flash[:notice] = 'Article mis à jour'
      redirect_to my_article_path(@article)
    else
      render :edit_my_article_path
    end
  end

  def destroy
    @article.destroy!
    flash[:notice] = 'Article supprimé'
    redirect_to my_articles_path
  end

private

  def article_params
    params.require(:article).permit(:title, :content, :source, :photo, :photo_cache)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
