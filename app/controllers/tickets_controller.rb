class TicketsController < ActionController::Base
  protect_from_forgery with: :exception
  layout "ticket"
  def index
  end
end
