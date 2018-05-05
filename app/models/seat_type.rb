class SeatType < ApplicationRecord
  has_many :seats, dependent: :destroy
  validates :pay_ticket, presence: true, uniqueness: true, format: { with: /\A\d+\z/, message: "Integer only." }
end
