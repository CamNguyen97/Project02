class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_user!, :ensure_admin!
  protect_from_forgery with: :exception
  layout "admin"

  private

  def ensure_admin!
    unless current_user.role?
      redirect_to root_path
      return false
    end
  end
end