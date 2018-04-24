class Admin::MoviesController < Admin::ApplicationController
  def index
  	@movies = Movie.all
  end
end