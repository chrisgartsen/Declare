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

    trait :euro do
      code 'EUR'
      name 'Euro'
    end

    trait :usd do
      code 'USD'
      name 'US Dollars'
    end

    trait :gbp do
      code 'GBP'
      name 'Pound Sterling'
    end

  end

end
