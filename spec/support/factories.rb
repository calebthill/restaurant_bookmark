FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Goodwin"
    sequence(:email) { |n| "calebthriller#{n}@gmail.com" }
    password "123456789"
    password_confirmation "123456789"
  end

  factory :restaurant do
    name "Little Italia"
    address "333 test dr"
    city "Boston"
    state "MA"
    zipcode "444444"

    user
  end

  factory :comment do
    body "Make sure you always get the chicken!"

    user
    restaurant
  end
end
