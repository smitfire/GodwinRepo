class CategoriesController < ApplicationController
  def index
  end

  def show
  	@category= Category.find(params[:id])
      mything = Category.build_json_res
      if request.xhr? 
        render json: mything
      end
  end

  def new
  end
end

