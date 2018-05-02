class TicketsController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  layout "ticket"
  def index
  end
end
