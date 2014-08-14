class LikesController < ApplicationController
  def new
  end

  def create
    if request.xhr?
      like = Like.create(like_params)
      @post = like.post
      render json: @post.likes.count
    end
  end

  def update
  end

  private
    def like_params
      params.require(:like).permit(:user_id, :post_id, :comment_id)
    end
end
