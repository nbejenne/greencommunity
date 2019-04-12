class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.article = Article.find(params[:article_id])
      if @comment.save!
        respond_to do |format|
          format.html { redirect_to article_path(params[:article_id]) }
          format.js
        end
      else
        respond_to do |format|
          format.html { render 'restaurant/show' }
          format.js
        end
      end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end
