FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password "Secret"
    password_confirmation "Secret"
  end

  trait :missing_name do
    name nil
  end

  trait :missing_password do
    password nil
  end

  trait :password_mismatch do
    password_confirmation 'anothersecret'
  end

  trait :missing_email do
    email nil
  end

  trait :active do
    active true
  end

  trait :inactive do
    active false
  end

  trait :admin do
    admin true
  end

  trait :additional_user do
    name 'Second User'
    email 'second@user.nl'
  end

end
