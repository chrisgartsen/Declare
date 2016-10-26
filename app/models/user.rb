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

  private

    def encrypt_password
      self.password_hash = 'HASH'
      self.password_salt = 'SALT'
    end

end
