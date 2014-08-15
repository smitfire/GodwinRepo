class HomeController < ApplicationController
  def index
  	@posts = Post.all.sample(9)
  	
  end
end
