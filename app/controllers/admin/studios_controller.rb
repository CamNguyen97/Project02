class Admin::StudiosController < Admin::ApplicationController
  before_action :studio_read, except: %w(index, create, new)
  def index
  	@studios = Studio.all.where(is_delete: false)
  end

  def create
    @studio = Studio.new studio_params
    if @studio.save
      flash[:success] = t "new_suscess"
      redirect_to admin_studios_path
    else
      render :new
    end
     respond_to do |format|
       format.js
     end
  end

  def new
    @studio = Studio.new
  end

  def edit
  end

  def update
    if @studio.update_attributes studio_params
      flash[:success] = t "update_suscess"
      redirect_to admin_studios_path
    else
      render :edit
    end
  end

  def delete
    @studio_d = Studio.find_by id: params[:studio_id]
  end

  def destroy
    @studio_des = Studio.find_by id: params[:id]
    if @studio_des.update_attributes is_delete:true
      flash[:success] = t "delete_suscess"
      redirect_to admin_studios_path
    else
      render :edit
    end
  end

  private

  def studio_params
  	params.require(:studio).permit :name, :status
  end

  def studio_read
    @studio = Studio.find_by id: params[:id]
  end
end
