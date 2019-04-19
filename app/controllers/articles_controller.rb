class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.all
  end

  def show
    @comments = @article.comments
    @comment = Comment.new
    @like = @article.likes.where(user: current_user).first
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    capitalize_article(@article)
    if @article.save
      flash[:notice] = 'Article créé'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

private

  def article_params
    params.require(:article).permit(:title, :content, :source, :photo, :photo_cache, :tagline)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def capitalize_article (article)
    article.title = article.title.capitalize!
    article.tagline = article.tagline.capitalize!
    article.content = article.content.capitalize!
    article.source = article.source.capitalize!
  end
end
