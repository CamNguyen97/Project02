class Ticket < ApplicationRecord
  has_one :seat, dependent: :destroy
  belongs_to :user, optional: true
end
