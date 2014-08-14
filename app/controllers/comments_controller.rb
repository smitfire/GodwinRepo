class CommentsController < ApplicationController
  def index
    @comments = User.find(params[:user_id]).comments
  end
  def create
    comment = Comment.create(comment_params)
    redirect_to post_path(comment.post.id)    
  end

  def destroy
      Comment.destroy(params[:id])
      redirect_to post_path(params[:post_id])
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end