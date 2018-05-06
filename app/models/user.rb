class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tickets, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, presence: true,
    length: {minimum: Settings.model.users.minimum_password}, allow_nil: true
  validates :email, presence: true,
    length: {maximum: Settings.model.users.maximum_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
   def self.valid_login?(email, password)
    user = where(email: email).first
    [user&.valid_password?(password), user]
  end

  def reset_authentication_token!
    update_column(:authentication_token, Devise.friendly_token)
  end
end
