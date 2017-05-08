class ContactMessage < ApplicationRecord

  validates :email, email_format: { message: 'does not appear to be a valid e-mail address' }, presence: true
  validates :message, presence: true

end
