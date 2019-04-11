class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save!
      flash[:notice] = 'Article créé'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

private

  def article_params
    params.require(:article).permit(:title, :content, :source, :photo, :photo_cache)
  end
end
