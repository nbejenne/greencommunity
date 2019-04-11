class My::ArticlesController < ApplicationController
  def index
    @articles = current_user.articles
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    binding.pry
    @article = Article.find(params[:id])
    if @article.update!(article_params)
      flash[:notice] = 'Article mis à jour'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

private

  def article_params
    params.require(:article).permit(:title, :content, :source, :photo, :photo_cache)
  end
end
