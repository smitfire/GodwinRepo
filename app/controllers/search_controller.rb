class SearchController < ApplicationController
  def index
  end

  def results
    # accuser = Accuser.find_by(title: params[:accuser])
    # accused = Accused.find_by(title: params[:accused])
    accuser_category_posts  = Category.find(params[:accuser_category]).accuser_posts
    accusedd_category_posts = Category.find(params[:accused_category]).accused_posts
    @posts = []
    (accuser_category_posts & accusedd_category_posts).each do |post|
      @posts << post
    end
    render 'index'
  end

end