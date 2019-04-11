class My::ArticlesController < ApplicationController
  def index
    @articles = current_user.articles
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update!(article_params)
      flash[:notice] = 'Article mis à jour'
      redirect_to article_path(@article)
    else
      render :edit_my_article_path
    end
  end

  def destroy
    @restaurant = Article.find(params[:id])
    @restaurant.destroy!
    flash[:notice] = 'Article supprimé'
    redirect_to articles_path
  end

private

  def article_params
    params.require(:article).permit(:title, :content, :source, :photo, :photo_cache)
  end
end
