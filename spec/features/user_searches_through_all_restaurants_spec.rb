require 'rails_helper'

feature 'User can search through all restaurants by category or by name' do
  scenario 'User searches for a category' do
    user = FactoryGirl.create(:user)
    5.times {FactoryGirl.create(:restaurant)}
    5.times {FactoryGirl.create(:restaurant, name: "The filling Station")}
    restaurant = FactoryGirl.create(:restaurant, name: "The Farmhouse", category: "American")

    visit root_path
    log_in(user)
    click_on "All Restaurants"

    fill_in "search", with: "American"
    click_on "Search"

    expect(page).to have_content("The Farmhouse")
    expect(page).to_not have_content("Little Italia")
  end

  scenario 'User searches for the name of the restaurant' do
    user = FactoryGirl.create(:user)
    5.times {FactoryGirl.create(:restaurant)}
    5.times {FactoryGirl.create(:restaurant, name: "The filling Station")}
    restaurant = FactoryGirl.create(:restaurant, name: "The Farmhouse", category: "American")

    visit root_path
    log_in(user)
    click_on "All Restaurants"

    fill_in "search", with: "The Farmhouse"
    click_on "Search"

    expect(page).to have_content("The Farmhouse")
    expect(page).to_not have_content("Little Italia")
  end

  scenario 'User only searches for part of the category' do
    user = FactoryGirl.create(:user)
    5.times {FactoryGirl.create(:restaurant)}
    5.times {FactoryGirl.create(:restaurant, name: "The filling Station")}
    restaurant = FactoryGirl.create(:restaurant, name: "The Farmhouse", category: "American")

    visit root_path
    log_in(user)
    click_on "All Restaurants"

    fill_in "search", with: "americ"
    click_on "Search"

    expect(page).to have_content("The Farmhouse")
    expect(page).to_not have_content("Little Italia")
  end
end
