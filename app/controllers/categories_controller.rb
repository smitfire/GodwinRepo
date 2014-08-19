class CategoriesController < ApplicationController
  def index
      res_for_cat_index = Category.build_json_res_for_cat_index
      if request.xhr? 
        render json: res_for_cat_index
      end
  end

  def show
    @category = Category.find(params[:id])
    res_for_cat = @category.build_json_res_for_cat
    if request.xhr?
      render json: res_for_cat
    end
  end

  def new
  end
  
end

