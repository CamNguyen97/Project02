class Cinemaroom < ApplicationRecord
  has_many :schedules, dependent: :destroy
end
