class Cinemaroom < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :seats, dependent: :destroy
end
