class PostsController < ApplicationController
  def index
    @posts = Post.find_all_by(event_date:params[:post])
  end
  
  def new
    
  end

  def create
    @post = Post.create(post_params)
    build_relationships(params, @post.id)
    redirect_to post_path(@post.id)
  end

  def show  
    @post = Post.find(params[:id]) 
    @user = @post.user
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to user_path(current_user.id)  
  end

  def edit
    @post = Post.find(params[:id])    
  end

  def update
    post_update(params)
    redirect_to user_path(current_user.id)
  end
  
  def date
    @posts = Post.find_all_by_event_date(Post.find(params[:post_id]).event_date)
    render "tags/_posts_list"
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :url, :accuser_id, :accused_id, :title, :quote, :excerpt, :event_date)
    end

end
