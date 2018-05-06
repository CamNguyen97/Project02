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
    @sum_seat = Ticket.join_user_seat
      .where("tickets.status=? and tickets.user_id=? and tickets.schedule_id=?", :t, @user.id, @schedule)
    @sum_seat_vip = Ticket.join_user_seat
      .where("tickets.status=? and tickets.user_id=? and tickets.schedule_id=? and seats.seat_type_id=?", :t, @user.id, @schedule, 2)
    @sum_money_vip = SeatType.find_by id: 2
    @sum_money_bt = SeatType.find_by id: 1
    @sum= @sum_seat_vip.count*@sum_money_vip.pay_ticket + (@sum_seat.count - @sum_seat_vip.count)*@sum_money_bt.pay_ticket
    @movie = Schedule.join_cinemaroom_schedule_time.where("schedules.id=?", @schedule)
  end

  def create
  	a = JSON.parse(params[:obj])
    b = a.to_json
    object = JSON.parse(b, object_class: Ticket)
    cr = 2
    Ticket.transaction do
      object.each do |attrs|
          Ticket.create seat_id: attrs.seat_id, schedule_id: attrs.schedule_id, 
            user_id: attrs.user_id,status: attrs.status
          if attrs.status == true
          	@seat = Seat.find_by id: attrs.seat_id
          	@seat.update_attributes status: false 
          end
      end
    end
  end
end
