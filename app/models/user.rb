class User < ApplicationRecord
  before_create { self.api_key = secure_key }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Must be valid email address' }

  has_many :favorites
  has_secure_password

  def secure_key
    SecureRandom.hex(12)
  end
end
