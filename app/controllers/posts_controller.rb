class PostsController < ApplicationController
  def index
  end
  
  def new
  	
  end

  def create
  	@post = Post.create(url: params[:post][:url],category: params[:post][:category],accused: params[:post][:accused],accuser: params[:post][:accuser], quote: params[:post][:quote], excerpt: params[:post][:excerpt], user_id: current_user.id )
  	Tag.create(title: params[:post][:category])
  	Tag.create(title: params[:post][:accuser])
  	Tag.create(title: params[:post][:accused])
  	redirect_to post_path(@post.id)
  end
  def show
  	@post = Post.find(params[:id])
  	@tag_accuser = Tag.find_by_title(@post.accuser)
  	@tag_accused = Tag.find_by_title(@post.accused)
  	@user = @post.user
  end
end
