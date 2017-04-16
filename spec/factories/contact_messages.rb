FactoryGirl.define do
  factory :contact_message do
    email   Faker::Internet.email
    message Faker::Lorem.paragraph

    trait :missing_email do
      email nil
    end

    trait :missing_message do
      message nil
    end

  end
end
