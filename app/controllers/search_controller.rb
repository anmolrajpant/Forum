class SearchController < ApplicationController
  def show
  	@search_query = params[:search][:search_query]
  	@results = Post.where("title like ?", "%#{@search_query}%")
  end
end
