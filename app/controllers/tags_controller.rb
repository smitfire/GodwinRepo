class TagsController < ApplicationController
  def index
  end

  def show
  	@tag = Tag.find_all_by_id(params[:id]).first
  	@posts = @tag.posts


  end

end