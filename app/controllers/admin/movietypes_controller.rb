class Admin::MovietypesController < Admin::ApplicationController
  before_action :movietype_read, except: %W(index create new)
  def index
  	@movietypes = Movietype.all.where(is_delete: false)
  end

  def create
    @movietype = Movietype.new movietype_params
    if @movietype.save
     flash[:success] = t "new_suscess"
      redirect_to admin_movietypes_path
    else
      render :new
    end
  end

  def new
    @movietype = Movietype.new
  end

  def edit
    
  end

  def update
    if @movietype.update_attributes movietype_params
     flash[:success] = t "update_suscess"
      redirect_to admin_movietypes_path
    else
      render :edit
    end
  end

  def delete
     @movietype_d = Movietype.find_by id: params[:movietype_id]
  end

  def destroy
     @movietype_d = Movietype.find_by id: params[:id]
     if @movietype_d.update_attributes is_delete:true
      flash[:success] = t "delete_suscess"
      redirect_to admin_movietypes_path
    else
      render :edit
    end
  end


  private

  def movietype_params
  	params.require(:movietype).permit :name, :status
  end

  def movietype_read
    @movietype = Movietype.find_by id: params[:id]
  end
end
