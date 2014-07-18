require 'rails_helper'

feature "User favorites restaurant from a restaurant from the yelp search" do
  scenario "User clicks the star to favorite the restaurant on the yelp search", :vcr do
    user = FactoryGirl.create(:user)

    log_in(user)

    click_on "Search Yelp!"

    within ".yelp_search_and_results" do
      fill_in "Restaurant Name", with: "Quay Coffee"
      fill_in "City", with: "Kansas City"
      fill_in "State", with: "MO"

      click_button "Search"
    end

    within('.search_results') do
      page.find('#result_1').click
    end
    expect(page).to have_content("Quay Coffee")
    expect(page).to have_content("816-471-7277")
    expect(page).to have_content("Kansas City MO")
  end
end
