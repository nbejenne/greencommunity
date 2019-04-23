class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = Article.find(params[:article_id])
    @comment.author = current_user.id
      if @comment.save!
        respond_to do |format|
          format.html { redirect_to article_path(params[:article_id]) }
          format.js
        end
      else
        respond_to do |format|
          format.html { render 'articles/show' }
          format.js
        end
      end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :article_id, :author)
  end
end
