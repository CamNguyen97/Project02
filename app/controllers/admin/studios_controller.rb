class Admin::StudiosController < Admin::ApplicationController
  before_action :studio_read, except: %w(index, create, new)

  
  def index
  	@studios = Studio.all
  end

  def create
    @studio = Studio.new studio_params
    if @studio.save
      # flash[:suscces] = t "suscess"
      redirect_to admin_studios_path
    else
      # flash[:danger] = t "danger"
      render :new
    end
     respond_to do |format|
       format.js
     end
  end

  def new
    @studio = Studio.new
    @list_movie = Movie.all.map { |lst| [lst.name, lst.id] }
  end

  def edit
    @list_movie = Movie.all.map { |lst| [lst.name, lst.id] }
  end

  def update
    if @studio.update_attributes studio_params
      # flash[:suscces] = t "suscess"
      redirect_to admin_studios_path
    else
      # flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def studio_params
  	params.require(:studio).permit :name, :status, :movie_id
  end

  def studio_read
    @studio = Studio.find_by id: params[:id]
  end
end
