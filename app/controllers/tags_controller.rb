class TagsController < ApplicationController
before_filter :require_login, only: [:destroy] #prevent unauthorised users deleting tags.

  def index
  	@tags = Tag.all
  end

  def show
  	@tag = Tag.find(params[:id])
  end
end
