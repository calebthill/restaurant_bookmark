FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Goodwin"
    sequence(:email) { |n| "calebthriller#{n}@gmail.com" }
    password "123456789"
    password_confirmation "123456789"
  end
end
