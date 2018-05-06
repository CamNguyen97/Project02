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

  def create
  	a = JSON.parse(params[:obj])
    b = a.to_json
    object = JSON.parse(b, object_class: Ticket)
    byebug
    cr = 2
    Ticket.transaction do
      object.each do |attrs|
          Ticket.create seat_id: attrs.seat_id, schedule_id: attrs.schedule_id, user_id: attrs.user_id,status: attrs.status
          if attrs.status == true
          	@seat = Seat.find_by id: attrs.seat_id
          	@seat.update_attributes status: false 
          end
      end
    end
  end
end
