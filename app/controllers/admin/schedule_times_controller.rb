class Admin::ScheduleTimesController < Admin::ApplicationController
  before_action :scheduleTime_read, except: %W(index create new)
  before_action :search_duplicates, only: %W(create update)
  def index
  	@schedule_times = ScheduleTime.all.where(is_delete: false)
  end

  def create
    if @schedule_date.empty? & check_time?
      if check_time? & @schedule_time.save
        flash[:success] = t "new_suscess"
        redirect_to admin_schedule_times_path
      else
        flash[:danger] = t "danger"
        render :new
      end
    else
      if !check_time?
        flash[:danger] =  t "time_used"
      else
        flash[:danger] =  t "data_used"
      end
      redirect_to admin_schedule_times_path
    end
  end

  def new
    @schedule_time = ScheduleTime.new
  end

  def edit
    
  end

  def update
    if @schedule_time.update_attributes scheduleTime_param
      flash[:success] = t "update_suscess"
      redirect_to admin_schedule_times_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def delete
    @schedule_time_d = ScheduleTime.find_by id: params[:schedule_time_id]
  end

  def destroy
     @schedule_time_d = ScheduleTime.find_by id: params[:id]
     if @schedule_time_d.update_attributes is_delete:true
      flash[:success] = t "delete_suscess"
      redirect_to admin_schedule_times_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  private

  def scheduleTime_param
  	params.require(:schedule_time).permit :start_time, :end_time, :status
  end

  def scheduleTime_read
    @schedule_time = ScheduleTime.find_by id: params[:id]
  end

  def check_time?
    return @schedule_time.start_time != @schedule_time.end_time && @schedule_time.start_time.to_i < @schedule_time.end_time.to_i
  end

  def search_duplicates
    @schedule_time = ScheduleTime.new scheduleTime_param
    @schedule_date = ScheduleTime.select("*")
      .where("schedule_times.start_time=? and schedule_times.end_time=? ", @schedule_time.start_time, @schedule_time.end_time)
  end
end
