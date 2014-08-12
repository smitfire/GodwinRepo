class CategoriesController < ApplicationController
  def index
  end

  def show
  	@category= Category.find(params[:id])
  	@posts_accused = @category.accused_posts
  	@posts_accuser = @category.accuser_posts
      mything = Category.build_json_res
      if request.xhr? 
        render json: mything
      end
  end

  def new
  end
end
