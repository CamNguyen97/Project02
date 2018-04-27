class User < ApplicationRecord
  has_many :tickets, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A((\+841|01)[2689]|(\+849|09))[0-9]{8}\z/i
  validates :name, presence: true,
    length: {maximum: Settings.model.users.maximum_name}
  validates :status, presence: true
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.model.users.minimum_password}, allow_nil: true
  validates :address, presence: true
  validates :email, presence: true,
    length: {maximum: Settings.model.users.maximum_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :phone, presence: true,
    format: {with: VALID_PHONE_REGEX}, uniqueness: {case_sensitive: false}
end
