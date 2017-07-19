FactoryGirl.define do
  factory :expense do
    user nil
    project nil
    payment_type nil
    expense_type nil
    amount "9.99"
    currency nil
    expense_date "2017-07-19"
  end
end
