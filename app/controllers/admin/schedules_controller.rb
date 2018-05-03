class Admin::SchedulesController < Admin::ApplicationController
  before_action :schedule_read, except: %W(index create new)
  def index
  	@schedules = Schedule.all.where(is_delete: false)
  end

  def create
    @schedule = Schedule.new schedule_params
    if @schedule.save
      # flash[:suscces] = t "suscess"
      redirect_to admin_schedules_path
    else
      # flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @schedule = Schedule.new
    @list_movie = Movie.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
    @list_cinemaroom = Cinemaroom.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
    @list_schedule_time = ScheduleTime.all.where(is_delete: false).map { |lst| [lst.id, lst.id] }
  end

  def edit
    @list_movie = Movie.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
    @list_cinemaroom = Cinemaroom.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
    @list_schedule_time = ScheduleTime.all.where(is_delete: false).map { |lst| [lst.id, lst.id] }
  end

  def update
    if @schedule.update_attributes schedule_params
      # flash[:suscces] = t "suscess"
      redirect_to admin_schedules_path
    else
      # flash[:danger] = t "danger"
      render :edit
    end
  end

  def delete
     @scheduleTime_d = Schedule.find_by id: params[:schedule_id]
  end

  def destroy
     @scheduleTime_d = Schedule.find_by id: params[:id]
     byebug
     if @scheduleTime_d.update_attributes is_delete:true
      # flash[:suscces] = t "suscess"
      redirect_to admin_schedules_path
    else
      # flash[:danger] = t "danger"
      render :edit
    end
  end

  def getdataTime
    @scheduleTime = ScheduleTime.find_by id: params[:schedule_id]
    render json: @scheduleTime
  end

  private

  def schedule_params
  	params.require(:schedule).permit :schedule_time_id, :date_movie, :movie_id, :cinemaroom_id, :status 
  end

  def schedule_read
    @schedule = Schedule.find_by id: params[:id]
  end
end
