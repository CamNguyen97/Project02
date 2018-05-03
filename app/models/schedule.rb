class Schedule < ApplicationRecord
  belongs_to :movie, optional: true
  belongs_to :schedule_time, optional: true
  belongs_to :cinemaroom, optional: true
  has_many :tickets, dependent: :destroy

  scope :join_cinemaroom_schedule_time, -> do
    joins(:schedule_time, :cinemaroom)
  end
end
