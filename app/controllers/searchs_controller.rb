class SearchsController < ApplicationController
  def index
    @movies = Movie.search(params[:search], params[:id])
      .page(params[:page]).per(Settings.search)
  end
end
