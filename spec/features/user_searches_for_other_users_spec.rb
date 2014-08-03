require 'rails_helper'

feature "User searches for a user" do
  scenario "User fills in search form with a users first name and sees that user" do
    5.times { FactoryGirl.create(:user) }
    caleb = FactoryGirl.create(:user, first_name: "Caleb")

    log_in(caleb)
    click_on "Users"
    fill_in "search", with: "Caleb"
    click_on "Search"

    expect(page).to have_content("Caleb Goodwin")
    expect(page).to_not have_content("Wendel Goodwin")
  end

  scenario "User fills in search form with a users first name and sees that user" do
    5.times { FactoryGirl.create(:user, last_name: "Thill") }
    caleb = FactoryGirl.create(:user, first_name: "Caleb")

    log_in(caleb)
    click_on "Users"
    fill_in "search", with: "Goodwin"
    click_on "Search"

    expect(page).to have_content("Caleb Goodwin")
    expect(page).to_not have_content("Wendel Thill")
  end

  scenario "User fills in search form with a users partial first name" do
    5.times { FactoryGirl.create(:user, last_name: "Thill") }
    caleb = FactoryGirl.create(:user, first_name: "Caleb")

    log_in(caleb)
    click_on "Users"
    fill_in "search", with: "Goodw"
    click_on "Search"

    expect(page).to have_content("Caleb Goodwin")
    expect(page).to_not have_content("Wendel Thill")
  end
end

