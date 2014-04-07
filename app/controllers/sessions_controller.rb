class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.find_by_email(params[:user][:email])
      user = User.find_by_email(params[:user][:email])
      @user = user.authenticate(params[:user][:password])
      if @user
        session[:user_id] = @user.id
        redirect_to user_posts_path(@user.id)
      else
        redirect_to root_path
      end
    else
      @user = User.create!(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
      session[:user_id] = @user.id
      redirect_to user_posts_path(@user.id)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
