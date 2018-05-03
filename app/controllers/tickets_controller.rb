class TicketsController < ActionController::Base
  before_action :authenticate_user!
  layout "ticket"
  def index
  end
end
