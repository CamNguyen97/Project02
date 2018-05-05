class Admin::ApplicationController < ActionController::Base
 # before_action :check_admin?
  protect_from_forgery with: :exception
  layout "admin"

  def check_admin?
  	current_user.role?
  end
end