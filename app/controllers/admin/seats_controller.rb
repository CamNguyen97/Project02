class Admin::SeatsController < Admin::ApplicationController
  before_action :seat_read, except: %W(index create new)
  def index
  	@seats = Seat.all
  end

  def create
    @seats = Seat.new seat_params
    if @seats.save
       flash[:suscces] = t "suscess"
      redirect_to admin_seats_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @seats = Seat.new
  end

  def edit
  end

  def update
    if @seats.update_attributes seat_params
      flash[:suscces] = t "suscess"
      redirect_to admin_seats_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def seat_params
  	params.require(:seat).permit :num_of_row, :num_of_collum, 
      :seat_type, :cinemaroom_id, :status
  end

  def seat_read
    @seats = Seat.find_by id: params[:id]
  end
end
