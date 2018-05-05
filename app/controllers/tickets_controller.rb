class TicketsController < ActionController::Base
  protect_from_forgery with: :exception
  layout "ticket"
  def index
  end

  def show
  	@cinemaroom = Cinemaroom.find_by(id: params[:cinemaroom_id])
  	@seat = Seat.all.where cinemaroom_id: params[:cinemaroom_id]
  	@schedule = params[:schedule_id]
  	@user = current_user
  end

  def loadData
  	a = params[:ticket_id]
  end
end
