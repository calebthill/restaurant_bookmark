require 'rails_helper'

feature "User sees a list of all the other users and can friend them" do
  scenario "User sees a list of all the users" do
    user = FactoryGirl.create(:user)
    5.times { FactoryGirl.create(:user, first_name: "Caleb") }
    5.times { FactoryGirl.create(:user, first_name: "Wendel") }

    log_in(user)
    click_on("Users")
    expect(page).to have_content("Caleb")
    expect(page).to have_content("Wendel")
  end
end
