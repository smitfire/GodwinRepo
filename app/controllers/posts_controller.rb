class PostsController < ApplicationController
  def index
    @posts = Post.find_all_by_date(params[:post])
    # @posts = Post.find(:all, limit: 9)
    # @numbers = Post.group(category:).count
    # render :json => @posts
  end
  
  def new
  	
  end

  def create
  	@post = Post.create(url: params[:post][:url],category: params[:post][:category],accused: params[:post][:accused],accuser: params[:post][:accuser], quote: params[:post][:quote], excerpt: params[:post][:excerpt], user_id: current_user.id )

  	Tag.first_or_create(title: params[:post][:category]).valid?
  	Tag.first_or_create(title: params[:post][:accuser]).valid?
  	Tag.first_or_create(title: params[:post][:accused]).valid?
  	redirect_to post_path(@post.id)
  end

  def show  
    @post = Post.find(params[:id]) 
    @tag_accuser = Tag.find_by_title(@post.accuser)
    @tag_accused = Tag.find_by_title(@post.accused)
    @user = @post.user
  end

  def date
    @posts = Post.find_all_by_date(Post.find(params[:post_id]).date)
    # render template: "tags/posts_list"
    render "tags/_posts_list"
  end

end
