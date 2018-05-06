class Admin::CinemaroomsController < Admin::ApplicationController
  before_action :cinemaroom_read, except: %W(index create new)
  def index
  	@cinemarooms = Cinemaroom.all.where(is_delete: false)
  end

  def create
    @cinemaroom = Cinemaroom.new cinemaroom_params
    if @cinemaroom.save
      flash[:success] = t "new_suscess"
      redirect_to admin_cinemarooms_path
    else
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
      flash[:success] = t "update_suscess"
      redirect_to admin_cinemarooms_path
    else
      render :edit
    end
  end

  def delete
     @cinemaroom_d = Cinemaroom.find_by id: params[:cinemaroom_id]
  end

  def destroy
     @cinemaroom_d = Cinemaroom.find_by id: params[:id]
     if @cinemaroom_d.update_attributes is_delete:true
      flash[:success] = t "delete_suscess"
      redirect_to admin_cinemarooms_path
    else
      render :edit
    end
  end


  private

  def cinemaroom_params
  	params.require(:cinemaroom).permit :name, :descreption,:status,
      :sum_of_row, :sum_of_collum 
  end

  def cinemaroom_read
    @cinemaroom = Cinemaroom.find_by id: params[:id]
  end
end
