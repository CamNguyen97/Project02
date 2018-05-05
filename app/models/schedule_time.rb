class ScheduleTime < ApplicationRecord
  has_many :schedules, dependent: :destroy
  VALID_TIME_REGEX = /\A([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\z/i
  validates :start_time, presence: true, format: {with: VALID_TIME_REGEX}
  validates :end_time, presence: true, format: {with: VALID_TIME_REGEX}
end
