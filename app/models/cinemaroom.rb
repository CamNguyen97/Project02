class Cinemaroom < ApplicationRecord
  belongs_to :schedule, optional: true
  has_many :seats, dependent: :destroy
end
