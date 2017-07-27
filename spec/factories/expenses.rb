FactoryGirl.define do
  factory :expense do
    project
    payment_type
    expense_type
    amount Faker::Number.decimal(2)
    currency
    expense_date Date.today

    trait :missing_project do
      project nil
    end

    trait :missing_payment_type do
      payment_type nil
    end

    trait :missing_expense_type do
      expense_type nil
    end

    trait :missing_currency do
      currency nil
    end

    trait :missing_expense_date do
      expense_date nil
    end

    trait :missing_amount do
      amount nil
    end
  end
end
