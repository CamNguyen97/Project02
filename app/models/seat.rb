class Seat < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :seat_type, optional: true
  belongs_to :cinemaroom, optional: true
  validates :num_of_row, presence: true, format: { with: /\A\d+\z/, message: "Integer only." }
  validates :num_of_collum, presence: true, format: { with: /\A\d+\z/, message: "Integer only." }
  validates :seat_type_id, presence: true
  validates :cinemaroom_id, presence: true
end
