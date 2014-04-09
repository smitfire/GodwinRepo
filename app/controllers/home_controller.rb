class HomeController < ApplicationController
  def index
  	@posts = Post.find(:all, limit: 9)
  	
  end
end
