class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def randoms
    	rand_string =  ('a'..'z').to_a + (0..9).to_a*3
    	rand_string.shuffle[0...12].join
  	end
  	helper_method :randoms
end
