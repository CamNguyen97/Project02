class Admin::SchedulesController < Admin::ApplicationController
  before_action :schedule_read, except: %W(index create new)
  before_action :search_duplicates, only: %W(create update)
  def index
    @schedules = Schedule.all.where(is_delete: false)
  end

  def create
    if @schedule_date.empty?
      if @schedule.save
        flash[:success] = t "new_suscess"
        redirect_to admin_schedules_path
      else
        flash[:danger] = t "danger"
        redirect_to admin_schedules_path
      end
    else
      flash[:danger] =  "lich chieu bi trung"
      redirect_to admin_schedules_path
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
    if @schedule_date.empty?
      if @schedule.update_attributes schedule_params
        flash[:success] = t "update_suscess"
        redirect_to admin_schedules_path
      else
        flash[:danger] = t "danger"
        redirect_to admin_schedules_path
      end
    else
      flash[:danger] =  "lich chieu bi trung"
      redirect_to admin_schedules_path
    end
  end

  def delete
     @scheduleTime_d = Schedule.find_by id: params[:schedule_id]
  end

  def destroy
     @scheduleTime_d = Schedule.find_by id: params[:id]
     if @scheduleTime_d.update_attributes is_delete:true
      flash[:success] = t "delete_suscess"
      redirect_to admin_schedules_path
    else
      flash[:danger] = t "danger"
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

  def search_duplicates
    @schedule = Schedule.new schedule_params
    @schedule_date = Schedule.select("*")
      .where("schedules.date_movie=? and schedules.schedule_time_id=? and schedules.cinemaroom_id=? and schedules.status=?", @schedule.date_movie, @schedule.schedule_time_id, @schedule.cinemaroom_id, @schedule.status)
  end
end
