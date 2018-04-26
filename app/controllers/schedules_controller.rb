class SchedulesController < ActionController::Base
  protect_from_forgery with: :exception
  layout "ticket"
  def show
  	@schedules= Schedule.all_for_group
  end
end
