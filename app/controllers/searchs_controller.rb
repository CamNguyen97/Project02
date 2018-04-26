class SearchsController < ApplicationController
  def index
    @movies = Movie.search(params[:search], params[:id])
  end
end
