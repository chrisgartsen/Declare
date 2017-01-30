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

    factory :first_project do
      name 'First Project'
    end

    factory :second_project do
      name 'Second Project'
    end

    factory :third_project do
      name 'Third Project'
    end

  end
end
