require 'rails_helper'

RSpec.describe FavoriteRestaurant, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:restaurant) }

  it { should have_valid(:user_id).when(1, 2) }
  it { should_not have_valid(:user_id).when("", "invalid", nil) }

  it { should have_valid(:restaurant_id).when(1, 2) }
  it { should_not have_valid(:restaurant_id).when("", "invalid", nil) }
end
