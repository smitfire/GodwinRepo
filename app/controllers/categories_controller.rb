class CategoriesController < ApplicationController
  def index
  end

  def show
  	@category= Category.find(params[:id])
  	@posts = @category.posts
  	# @category.accusers.each do |cat|
  	# 	@posts << cat.posts
  	# end
  end

  def new
  end
end
