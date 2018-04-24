class Admin::CinemaroomsController < Admin::ApplicationController
  before_action :cinemaroom_read, except: %W(index create new)
  def index
  	@cinemarooms = Cinemaroom.all
  end

  def create
    @cinemarooms = Cinemaroom.new cinemaroom_params
    if @cinemarooms.save
       flash[:suscces] = t "suscess"
      redirect_to admin_cinemarooms_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @cinemarooms = Cinemaroom.new
  end

  def edit
  end

  def update
    if @cinemarooms.update_attributes cinemaroom_params
      flash[:suscces] = t "suscess"
      redirect_to admin_cinemarooms_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def cinemaroom_params
  	params.require(:cinemaroom).permit :name, :descreption, :status, 
      :schedule_id
  end

  def cinemaroom_read
    @cinemarooms = Cinemaroom.find_by id: params[:id]
  end
end
