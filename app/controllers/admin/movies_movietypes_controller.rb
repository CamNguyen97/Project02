class Admin::MoviesMovietypesController < Admin::ApplicationController
  before_action :movies_movietype_read, except: %W(index create new)
  def index
  	@movies_movietypes = MoviesMovietype.all.where(is_delete: false)
  end

  def create
    @movies_movietype = MoviesMovietype.new movies_movietype_params
    if @movies_movietype.save
       # flash[:suscces] = t "suscess"
      redirect_to admin_movies_movietypes_path
    else
      # flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @movies_movietype = MoviesMovietype.new
  end

  def edit
  end

  def update
    if @movies.update_attributes movies_movietype_params
      # flash[:suscces] = t "suscess"
      redirect_to admin_movies_movietypes_path
    else
      # flash[:danger] = t "danger"
      render :edit
    end
  end

  def delete
     @scheduleTime_d = ScheduleTime.find_by id: params[:schedule_id]
  end

  def destroy
     @scheduleTime_d = ScheduleTime.find_by id: params[:schedule_id]
     if @scheduleTime_d.update_attributes is_delete:true
      # flash[:suscces] = t "suscess"
      redirect_to admin_movies_movietypes_path
    else
      # flash[:danger] = t "danger"
      render :edit
    end
  end


  private

  def movies_movietype_params
  	params.require(:movies_movietype).permit :movie_id, :movietype_id
  end

  def movies_movietype_read
    @movies_movietype = MoviesMovietype.find_by id: params[:id]
  end

end
