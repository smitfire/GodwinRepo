class SessionsController < ApplicationController   

  def omni_create
    auth_hash = request.env['omniauth.auth']
    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
      redirect_to root_url,  :notice => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:user_id] = auth.user.id
      redirect_to root_url, :notice => "Signed in!"
    end
  end

  def new
    @user = User.new
  end

  def create
    if User.find_by_email(params[:user][:email])
      user = User.find_by_email(params[:user][:email])
      @user = user.authenticate(params[:user][:password])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        redirect_to root_path
      end
    else
      @user = User.create!(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    end
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed Out!"
  end

end
