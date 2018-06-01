require 'bcrypt'

class User < ApplicationRecord
# this will read the password and access it
  attr_reader :password
  attr_accessor :password_confirmation

# this will encrypt the password
  def password=(unencrypted_password)
    @password = unencrypted_password
    self.password_digest = BCrypt::Password.create(unencrypted_password)
  end

# this will validate email is present and unique
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end
