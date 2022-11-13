# class User < ApplicationRecord
#   validates :name, :password_digest, presence: true
#   validates :email, presence: true, uniqueness: { case_sensitive: false }
#   validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Must be valid email address' }
#   has_secure_password
# end
