FactoryGirl.define do

  factory :currency do
    code 'EUR'
    name 'Euro'

    trait :missing_code do
      code nil
    end

    trait :missing_name do
      name nil
    end
  end

end
