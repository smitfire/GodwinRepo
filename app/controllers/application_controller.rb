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

  def build_relationships(params, post_id)
    post = Post.find(post_id)
    current_user.posts << post
    accuser = Accuser.find_or_create_by(title: params[:post][:accuser])
    accuser.posts << post
    Category.find(params[:post][:accuser_category_id]).accusers  << accuser
    accused = Accused.find_or_create_by(title: params[:post][:accused])
    accused.posts << post
    Category.find(params[:post][:accused_category_id]).accuseds  << accused
    post.tags << Tag.find_or_create_by(title: post.accuser.title);
    post.tags << Tag.find_or_create_by(title: post.accused.title)
  end
  helper_method :build_relationships

  def post_update(params)
    post = Post.find(params[:id])
    post.update(post_params)
    post.accuser.update(title: params[:post][:accuser][:title], category_id: params[:post][:accuser][:category])
    post.accused.update(title: params[:post][:accused][:title], category_id: params[:post][:accused][:category])
    post.tags[0].update( title:post.accuser.title)
    post.tags[1].update( title: post.accused.title)
  end
end
