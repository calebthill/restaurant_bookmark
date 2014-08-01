require 'rails_helper'

feature "user views another persons favorite restaurant (they have to be following them)" do
  scenario "User clicks on a user and can see their favorite restaurants" do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)

    log_in(user)
    click_on("Users")
  end
end
