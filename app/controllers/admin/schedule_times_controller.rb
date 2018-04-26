class Admin::ScheduleTimesController < Admin::ApplicationController
  before_action :scheduleTime_read, except: %W(index create new)
  def index
  	@schedule_times = ScheduleTime.all
  end

  def create
    @schedule_time = ScheduleTime.new scheduleTime_param
    if @schedule_time.save
       flash[:suscces] = t "suscess"
      redirect_to admin_schedule_times_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @schedule_time = ScheduleTime.new
  end

  def edit
    
  end

  def update
    if @schedule_time.update_attributes scheduleTime_param
      flash[:suscces] = t "suscess"
      redirect_to admin_schedule_times_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def scheduleTime_param
  	params.require(:schedule_time).permit :start_time, :end_time, :status
  end

  def scheduleTime_read
    @schedule_time = ScheduleTime.find_by id: params[:id]
  end
end