class CategoriesController < ApplicationController
  def index
  end

  def show
  	@category= Category.find(params[:id])
  	@posts = @category.posts
  end

  def new
  end
end
