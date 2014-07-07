require 'rails_helper'

feature "User creates a favorite restaurant" do
  #   As a new user
  # I want to add a restaurant to my page
  # so I can see a list of my favorite restaurants

  # Acceptance Criteria:

  # -I must have an account
  # -I must be logged in
  # -I must fill out a form specifying the name and city of the restaurant
  # -If one of the required fields is missing it will give an error
  # -upon successfully creating a restaurant, the user will be redirected
  #  to the restaurant they added or created. they will also see a flash message.

  scenario "User creates a valid restaurant and its added to their favorite restaurants" do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.build(:restaurant, user: user)
    previous_count = FavoriteRestaurant.count
    log_in(user)

    fill_in 'Name', with: restaurant.name
    fill_in 'Address', with: restaurant.address
    fill_in 'City', with: restaurant.city
    fill_in 'State', with: restaurant.state
    fill_in 'Zipcode', with: restaurant.zipcode

    click_on "Create Restaurant"

    expect(page).to have_content("You just created a restaurant!")
    expect(page).to have_content restaurant.name
    expect(page).to have_content restaurant.address
    expect(page).to have_content restaurant.city
    expect(page).to have_content restaurant.state
    expect(page).to have_content restaurant.zipcode
    expect(page).to have_content("Comment on this restaurant")

    expect(FavoriteRestaurant.count).to eq(previous_count + 1)
  end

  scenario "User creates an a restaurant without a required field" do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant, user: user)
    log_in(user)

    fill_in 'Name', with: restaurant.name
    fill_in 'Address', with: restaurant.address
    fill_in 'City', with: restaurant.city
    fill_in 'Zipcode', with: restaurant.zipcode

    click_on "Create Restaurant"

    expect(page).to have_content("That didnt go through!")
  end
end
