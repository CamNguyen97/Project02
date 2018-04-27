class Cinemaroom < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :seats, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :sum_of_row, presence: true, format: { with: /\A\d+\z/, message: "Integer only." }
  validates :sum_of_collum, presence: true, format: { with: /\A\d+\z/, message: "Integer only." }
end
