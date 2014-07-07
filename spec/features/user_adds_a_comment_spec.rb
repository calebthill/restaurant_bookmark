require 'rails_helper'

feature "User creates a comment for one of their favorite restaurants" do
  # As a logged in user
  # I want to create a comment for a favorite restaurant
  # So I can remember what I liked and hated about that restaurant.

  # Acceptance Criteria:

  # I must be logged in
  # I must go to the restaurants show page
  # I must supply a comment subject
  # I must supply a comment body
  # If I don't fill in a required I am presented with an error.
  # If I don't have the restaurant favorited, I cannot add a comment.
  scenario "A user creates a comment for their favorite restaurant succesfully", focus: true do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant, user: user)
    comment = FactoryGirl.build(:comment, restaurant: restaurant, user: user)
    log_in(user)

    visit restaurant_path(restaurant)
    expect(page).to have_content("Comment on this restaurant")

    fill_in "Body", with: comment.body
    click_on "Create comment"

    expect(page).to have_content comment.body
    expect(page).to have_content user.first_name
  end

  scenario "A user creates a comment for their favorite restaurant without a body" do
    user = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant, user_id: user.id)
    comment = FactoryGirl.create(:comment, restaurant_id: restaurant.id, user_id: user.id)
    log_in(user)


    fill_in 'Name', with: restaurant.name
    fill_in 'Address', with: restaurant.address
    fill_in 'City', with: restaurant.city
    fill_in 'State', with: restaurant.state
    fill_in 'Zipcode', with: restaurant.zipcode

    click_on "Create Restaurant"

    expect(page).to have_content("Comment on this restaurant")

    click_on "Create comment"
    expect(page).to have_content("That did not go through!")
  end

  scenario "A user doesnt see the comments unless its their favorite restaurant" do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)
    restaurant = FactoryGirl.create(:restaurant, user_id: user.id)
    comment = FactoryGirl.create(:comment, restaurant_id: restaurant.id, user_id: user.id)

    log_in(user1)

    click_on "All Restaurants"
    click_on restaurant.name

    expect(page).to have_content restaurant.name
    expect(page).to_not have_content("Comment on this restaurant")
  end
end
