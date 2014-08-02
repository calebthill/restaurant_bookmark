require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:comments) }
  it { should have_many(:favorite_restaurants) }
  it { should have_many(:restaurants) }
  it { should have_many(:created_restaurants) }

  it { should have_valid(:first_name).when("Caleb", "Josiah") }
  it { should_not have_valid(:first_name).when(1234) }

  it { should have_valid(:last_name).when("Goodwin", "John") }
  it { should_not have_valid(:last_name).when(123) }

  it { should have_valid(:email).when("Caleb@gmail.com", "Josiah@gmail.com") }
  it { should_not have_valid(:email).when("", nil, 123) }

  it { should have_valid(:password).when("123456789", "password123") }
  it { should_not have_valid(:password).when("", nil) }
end
