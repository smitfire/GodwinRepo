class PostsController < ApplicationController
  def index
  end
  
  def new
  	
  end

  def show
  	@post = Post.find(params[:id])
  	@tag_accuser = Tag.find_by_title(@post.accuser)
  	@tag_accused = Tag.find_by_title(@post.accused)
  	@user = @post.user
  end
end
