require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  it { should have_many(:favorite_restaurants) }
  it { should have_many(:users) }
  it { should have_many(:comments) }
  it { should belong_to(:user) }

  it { should have_valid(:name).when("Resetaurant", "Italia") }
  it { should_not have_valid(:name).when("", nil) }

  describe "is_favorite?" do
    it "should return true if restaurant is a favorite of the user" do
      restaurant = FactoryGirl.create(:restaurant)
      user = FactoryGirl.create(:user)
      user.restaurants << restaurant

      expect(restaurant.is_favorite?(user)).to eq(true)
    end

    it "should return false if it is not a user favorite" do
      restaurant = FactoryGirl.create(:restaurant)
      user = FactoryGirl.create(:user)

      expect(restaurant.is_favorite?(user)).to eq(false)
    end
  end

end
