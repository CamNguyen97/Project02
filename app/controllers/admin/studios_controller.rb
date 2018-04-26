class Admin::StudiosController < Admin::ApplicationController
  before_action :studio_read, except: %i(index)

  
  def index
  	@studios = Studio.all
  end

  def create
    @studio = Studio.new studio_params
    if @studio.save
       flash[:suscces] = t "suscess"
      redirect_to admin_studios_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @studio = Studio.new
  end

  def edit
  end

  def update
    if @studio.update_attributes studio_params
      flash[:suscces] = t "suscess"
      redirect_to admin_studios_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def studio_params
  	params.require(:studio).permit :name, :status
  end

  def studio_read
    @studio = Studio.find_by id: params[:id]
  end
end
