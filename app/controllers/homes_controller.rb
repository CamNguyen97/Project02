class HomesController < ApplicationController
  before_action :load_movie, only: :show
  before_action :load_movie_top3, only: %i(index show)
  def index
  	@movies = Movie.movie_select.page(params[:page]).per(3)
    @studios = Studio.sort_alpha
  end

  def show
    @schedules = Schedule.join_cinemaroom_schedule_time
      .where("schedules.movie_id=?", params[:id])
    @movie_type = MoviesMovietype.join_movie_movietype.where("movies.id=?", params[:id])
    @movie_type_id = MoviesMovietype.find_by(id: @movie_type.ids)
    @movie_lq = MoviesMovietype.join_movie_movietype
      .where("movietypes.id=? and movies.id!=?", @movie_type_id.movietype_id, params[:id])
      .limit Settings.homes.movie_lq
  end

  private

  def load_movie
    @movie = Movie.find_by id: params[:id]
  end

  def load_movie_top3
    @movie_top3 = Movie.movie_top3
  end
end
