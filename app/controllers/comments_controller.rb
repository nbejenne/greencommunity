class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.article = Article.find(params[:article_id])
    @comment.author = current_user.id
    @comment.save!
    flash[:notice] = 'Commentaire créé'
    redirect_to article_path(params[:article_id])
  end

private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end
