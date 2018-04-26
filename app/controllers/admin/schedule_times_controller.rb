class Admin::ScheduleTimesController < Admin::ApplicationController
  before_action :scheduleTime_read, except: %W(index create new)
  def index
  	@scheduleTimes = ScheduleTime.all
  end

  def create
    @scheduleTimes = ScheduleTime.new scheduleTime_params
    if @scheduleTimes.save
       flash[:suscces] = t "suscess"
      redirect_to admin_schedule_times_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @scheduleTimes = ScheduleTime.new
  end

  def edit
    
  end

  def update
    if @scheduleTimes.update_attributes scheduleTime_params
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

  def scheduleTime_params
  	params.require(:schedule_time).permit :start_time, :end_time, :status
    byebug
  end

  def scheduleTime_read
    @movietypes = ScheduleTime.find_by id: params[:id]
  end
end
