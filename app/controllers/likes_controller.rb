class LikesController < ApplicationController
  def new
  end

  def create
    puts "="*100
    puts like_params
    puts "="*100
    if request.xhr?
      @like = Like.create(like_params)
      @post = @like.post
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
