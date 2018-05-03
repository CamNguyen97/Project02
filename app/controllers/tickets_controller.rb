class TicketsController < ActionController::Base
  before_action :authenticate_user!
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
