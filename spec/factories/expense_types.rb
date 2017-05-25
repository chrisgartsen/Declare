FactoryGirl.define do
  factory :expense_type do
    name 'Public Transport'

    trait :missing_name do
      name nil
    end

  end
end
