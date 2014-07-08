require 'rails_helper'

feature 'User clicks a favorite button on someones favorite restaurant to make it their favorite' do
  # Acceptance Criteria:

  # -Must be logged in
  # -Must be on the restaurants show page
  # -Must click the favorite button
  # -When I click the favorite button I am notified that it has been added to my favorites.

  scenario 'User clicks the favorite button and the restaurant is added to their favorites' do
    user2 = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant)

    log_in(user2)
    click_link("All Restaurants")
    click_link restaurant.name

    click_on "Add to Favorites"

    expect(page).to have_content("Restaurant Added to favorites!")
    expect(page).to_not have_content("Add to Favorites")
    expect(page).to have_button("Remove from Favorites")
  end
end
