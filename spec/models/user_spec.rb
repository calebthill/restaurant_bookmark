require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:comments) }
  it { should have_many(:favorite_restaurants) }
  it { should have_many(:restaurants) }
  it { should have_many(:created_restaurants) }
end
