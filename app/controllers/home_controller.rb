class HomeController < ApplicationController
  def index
  	@posts = Post.popular.limit(9)
  end
end
