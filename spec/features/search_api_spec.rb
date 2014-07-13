require 'rails_helper'

feature "User searches the yelp api" do
  scenario "Fill out the form and get the results", :vcr do
    user = FactoryGirl.create(:user)
    log_in(user)

    within '.search' do
      fill_in "Restaurant Name", with: 'Quay'
      fill_in "City", with: 'Kansas City'
      fill_in "State", with: 'MO'

      click_on "Search"
    end

      expect(page).to have_content "Quay Coffee"
  end
end
