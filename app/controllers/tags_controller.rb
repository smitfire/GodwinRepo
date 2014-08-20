class TagsController < ApplicationController
  def index
    @tags = Tag.order('title')
  end

  def show
  	@tag = Tag.find(params[:id])
  	@posts = @tag.posts
  end

end
