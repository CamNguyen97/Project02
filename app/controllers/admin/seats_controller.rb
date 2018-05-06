class Admin::SeatsController < Admin::ApplicationController
  require "json"
  before_action :seat_read, except: %W(index create new)
  def index
    @page_type = Cinemaroom.all.where(is_delete: false).collect{ |u| [u.name, u.id]}
  	@seat_type = SeatType.all.collect{ |u| [u.name, u.id]}
  end

  def create
    a = JSON.parse(params[:obj])
    b = a.to_json
    object = JSON.parse(b, object_class: Seat)
    Seat.transaction do
      object.each do |attrs|
          Seat.create num_of_row: attrs.num_of_row, num_of_collum: attrs.num_of_collum, status: attrs.status,seat_type_id: attrs.seat_type_id, cinemaroom_id: attrs.cinemaroom_id
      end
    end
  end

  def new
    @seat = Seat.new
    @list_cinemaroom = Cinemaroom.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
  end

  def edit
    @list_cinemaroom = Cinemaroom.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
  end

  def update
    if @seat.update_attributes seat_params
      flash[:success] = t "update_suscess"
      redirect_to admin_seats_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  def cinemaroom_getdata
    @cinemaroom = Cinemaroom.find_by id: params[:seat_id]
    @seat = Seat.find_by cinemaroom_id: params[:seat_id]
    @h = Hash.new
    if @seat.present?
      @h[:sum_of_row] = @cinemaroom.sum_of_row
      @h[:sum_of_collum] = @cinemaroom.sum_of_collum
      @h[:seat] = true
      @h[:seats] = Seat.where(cinemaroom_id: params[:seat_id]).all
      render json: @h
    else
      @h[:sum_of_row] = @cinemaroom.sum_of_row
      @h[:sum_of_collum] = @cinemaroom.sum_of_collum
      @h[:seat] = false
      render json: @h
    end
  end

  private

  def seat_params
  	params.require(:seat).permit :num_of_row, :num_of_collum, 
      :seat_type_id, :status
  end

  def seat_read
    @seat = Seat.find_by id: params[:id]
  end
end
