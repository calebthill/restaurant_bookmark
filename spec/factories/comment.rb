FactoryGirl.define do
  factory :comment do
    body "Make sure you always get the chicken!"

    user
    restaurant
  end
end
