class Admin::UsersController < Admin::ApplicationController
  before_action :user_read, except: %W(index)
  def index
    @users = User.all.where(status: true)
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "update_suscess"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def delete
    @user_d = User.find_by id: params[:user_id]
  end

  def destroy
     @user_d = User.find_by id: params[:id]
     if @user_d.update_attributes status:false
      flash[:success] = t "delete_suscess"
      redirect_to admin_users_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit :email, :role, :status
  end

  def user_read
    @user = User.find_by id: params[:id]
  end
end

