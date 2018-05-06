class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_user!, :ensure_admin!
  protect_from_forgery with: :exception
  before_action :set_locale
  layout "admin"

  private

  def ensure_admin!
    unless current_user.role?
      redirect_to root_path
      return false
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options
    { locale: I18n.locale }
  end
end