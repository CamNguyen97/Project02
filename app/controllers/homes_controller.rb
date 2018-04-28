class HomesController < ApplicationController
  before_action :load_movie, only: :show
  def index
  	@movies = Movie.movie_select.page(params[:page]).per(4)
    @studios = Studio.sort_alpha
    @movie_top3 = Movie.movie_top3
  end

  def show
  end

  private

  def load_movie
    @movie = Movie.find_by id: params[:id]
  end
end
