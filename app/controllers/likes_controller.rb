class LikesController < ApplicationController
  def new
  end

  def create
  	Like.create(like_params)
  	redirect_to root_url
  end

  def update
  end

  private
    def like_params
      params.require(:like).permit(:user_id, :post_id, :comment_id)
    end
end
