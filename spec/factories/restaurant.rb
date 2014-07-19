FactoryGirl.define do
  factory :restaurant do
    name "Little Italia"
    address "333 test dr"
    city "Boston"
    state "MA"
    zipcode "444444"
    phone "8167398888"
    category "French"

    user
  end
end
