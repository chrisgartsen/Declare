FactoryGirl.define do
  factory :payment_type do
    name 'Cash Payment'

    trait :missing_name do
      name nil
    end

    trait :credit_card do
      name 'Credit Card'
    end

    trait :chip_card do
      name 'Chip Card'
    end

  end
end
