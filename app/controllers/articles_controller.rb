class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :vote]

  def index
    @articles = Article.all
  end

  def show
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

  def vote
    @current_user = current_user
    if !current_user.liked? @article
      @article.liked_by current_user
      respond_to do |format|
        #format.js
        format.html { redirect_to article_path(@article) }
      end

    elsif current_user.liked? @article
      @article.unliked_by current_user
      respond_to do |format|
        #format.js
        format.html { redirect_to article_path(@article) }
      end
    end
  end

private

  def article_params
    params.require(:article).permit(:title, :content, :source, :photo, :photo_cache)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
