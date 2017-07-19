class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :payment_type
  belongs_to :expense_type
  belongs_to :currency
end
