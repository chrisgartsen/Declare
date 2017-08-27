class ContactMessage < ApplicationRecord

  validates :message, presence: true
  validates :email, presence: true, email_format: { message: 'does not appear to be a valid e-mail address' }

end
