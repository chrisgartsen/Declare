class User < ApplicationRecord

  before_save :encrypt_password

  attr_accessor :password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  def activate
    self.active = true
  end

  def inactivate
    self.active = false
  end

  def authenticate(password)
    self.password_hash == self.hash_password(password)
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = self.hash_password(self.password)
  end

  def hash_password(password)
    BCrypt::Engine.hash_secret(password, self.password_salt)
  end

end
