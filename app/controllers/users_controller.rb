class UsersController < ApplicationController
  def index
  end

  def new
  	
  end
  
  def show
    @user = User.find(params[:id])
    session[:user_prof] = @user.id
    
    @posts = @user.posts
    
  end

  def values_for_js
    user = User.find(params[:user_id])
    total = user.total_likes_received
    post_total = user.posts.count
    render json: { total: total, post_total: post_total }
    
  end

end
