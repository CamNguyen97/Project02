class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :seat, optional: true
  belongs_to :schedule, optional: true
  validates :seat_id, presence: true
  validates :schedule_id, presence: true
  validates :user_id, presence: true
end
