class Admin::SchedulesController < Admin::ApplicationController
  before_action :schedule_read, except: %W(index create new)
  def index
  	@schedules = Schedule.all
  end

  def create
    @schedule = Schedule.new schedule_params
    if @schedule.save
       flash[:suscces] = t "suscess"
      redirect_to admin_schedules_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @schedule = Schedule.new
    @list_movie = Movie.all.map { |lst| [lst.name, lst.id] }
  end

  def edit
    @list_movie = Movie.all.map { |lst| [lst.name, lst.id] }
  end

  def update
    if @schedule.update_attributes schedule_params
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
      :movie_id
  end

  def schedule_read
    @schedule = Schedule.find_by id: params[:id]
  end
end
