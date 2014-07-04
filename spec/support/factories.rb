FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "The Beanery#{n}" }
    first_name "John"
    last_name "Goodwin"
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password "123456789"
    password_confirmation "123456789"
  end
end
