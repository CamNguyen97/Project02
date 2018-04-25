class Admin::SchedulesController < Admin::ApplicationController
  before_action :schedule_read, except: %W(index create new)
  def index
  	@schedules = Schedule.all
  end

  def create
    @schedules = Schedule.new schedule_params
    if @schedules.save
       flash[:suscces] = t "suscess"
      redirect_to admin_schedules_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @schedules = Schedule.new
  end

  def edit
  end

  def update
    if @schedules.update_attributes schedule_params
      flash[:suscces] = t "suscess"
      redirect_to admin_schedules_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def schedule_params
  	params.require(:schedule).permit :show_case, :date_movie, :status, 
      :schedule_id
  end

  def schedule_read
    @schedules = Schedule.find_by id: params[:id]
  end
end
