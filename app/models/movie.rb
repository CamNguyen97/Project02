class Movie < ApplicationRecord
  belongs_to :studio, optional: true
  has_many :movie_movietypes, dependent: :destroy
  has_many :schedules, dependent: :destroy
  mount_uploader :image, ImageUploader
end
