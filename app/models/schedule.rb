class Schedule < ApplicationRecord
  belongs_to :movie, optional: true
  has_many :cinemarooms, dependent: :destroy
end
