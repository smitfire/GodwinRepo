class CategoriesController < ApplicationController
  def index
  end

  def show
  	@category= Category.find(params[:id])
  	@posts_accused = @category.accused_posts
  	@posts_accuser = @category.accuser_posts
  	# @category.accusers.each do |cat|
  	# 	@posts << cat.posts
  	# end
  end

  def new
  end
end
