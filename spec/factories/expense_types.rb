FactoryGirl.define do
  factory :expense_type do
    name 'Public Transport'

    trait :missing_name do
      name nil
    end

    trait :cash_expense do
      name 'Cash Expenses'
    end

    trait :hotel_expense do
      name 'Hotel Expenses'
    end

  end
end
