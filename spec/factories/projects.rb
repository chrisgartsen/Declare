FactoryGirl.define do
  factory :project do
    user
    name Faker::Lorem.word

    trait :missing_name do
      name nil
    end

    trait :missing_user do
      user_id nil
    end

  end
end
