class UsersController < ApplicationController
  def index
  end

  def new
  	
  end
  
  def show
    @user = User.find(params[:id]) 
    @posts = @user.posts
    if request.xhr?
      build_pie_chart(@user.id)
    else
      render 'show'
    end
  end

end
