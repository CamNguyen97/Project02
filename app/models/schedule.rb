class Schedule < ApplicationRecord
  belongs_to :movie, optional: true
  has_many :cinemarooms, dependent: :destroy
  has_one :schedule_times, dependent: :destroy
end
