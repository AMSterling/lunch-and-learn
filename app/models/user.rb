class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Must be valid email address' }
  has_secure_password

  has_many :api_keys, as: :bearer

 def api_key
   api_key = self.api_keys.create! token: SecureRandom.hex
   api_key[:token]
 end
end
