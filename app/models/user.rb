class User < ApplicationRecord

  before_save :encrypt_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true


  private

    def encrypt_password
      self.password_hash = 'HASH'
      self.password_salt = 'SALT'
    end

end
