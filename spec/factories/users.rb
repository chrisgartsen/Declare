FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
  end

  trait :missing_name do
    name nil
  end

  trait :missing_email do
    email nil
  end

end
