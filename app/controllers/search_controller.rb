class SearchController < ApplicationController
  def index
  end

  def results
    accuser = Accuser.find_by(title: params[:accuser])
    accuser = Accused.find_by(title: params[:accused])
    @posts = Post.where(accuser_id: accuser.id, accused_id: accused.id).all
    
    render 'index'
  end

end