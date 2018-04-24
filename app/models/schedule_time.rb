class ScheduleTime < ApplicationRecord
  has_one :schedules, dependent: :destroy
end
