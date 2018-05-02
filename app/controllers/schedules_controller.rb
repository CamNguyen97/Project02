class SchedulesController < ActionController::Base
  protect_from_forgery with: :exception
  layout "ticket"
  before_action :load_movie, only: :show

  def show
  	@schedules = Schedule.joins(:schedule_time, :cinemaroom).where("schedules.movie_id=?", params[:id])
  end

  def load_movie
    @movie = Movie.find_by id: params[:id]
  end
end
