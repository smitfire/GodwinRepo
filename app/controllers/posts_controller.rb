class PostsController < ApplicationController
  def index
    @posts = Post.find_all_by_event_date(params[:post])
    # @posts = Post.find(:all, limit: 9)
    # @numbers = Post.group(category:).count
    # render :json => @posts
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

  def date
    @posts = Post.find_all_by_event_date(Post.find(params[:post_id]).event_date)
    render "tags/_posts_list"
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :url, :accuser_id, :accused_id, :title, :quote, :excerpt, :event_date)
    end

end
