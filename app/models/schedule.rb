class Schedule < ApplicationRecord
  belongs_to :movie, optional: true
  belongs_to :scheduel_time, optional: true
  belongs_to :cinemaroom, optional: true
  has_many :tickets, dependent: :destroy
end
