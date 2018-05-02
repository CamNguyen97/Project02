class Admin::CinemaroomsController < Admin::ApplicationController
  before_action :cinemaroom_read, except: %W(index create new)
  def index
  	@cinemarooms = Cinemaroom.all
  end

  def create
    @cinemaroom = Cinemaroom.new cinemaroom_params
    byebug
    if @cinemaroom.save
      # flash[:suscces] = t "suscess"
      redirect_to admin_cinemarooms_path
    else
      # flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @cinemaroom = Cinemaroom.new
  end

  def edit
  end

  def update
    if @cinemaroom.update_attributes cinemaroom_params
      # flash[:suscces] = t "suscess"
      redirect_to admin_cinemarooms_path
    else
      # flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def cinemaroom_params
  	params.require(:cinemaroom).permit :name, :descreption,:status, :sum_of_row, :sum_of_collum 
  end

  def cinemaroom_read
    @cinemaroom = Cinemaroom.find_by id: params[:id]
  end
end
