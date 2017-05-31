class Currency < ApplicationRecord

  validates :code, presence: true
  validates :name, presence: true

end
