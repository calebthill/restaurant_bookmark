require 'rails_helper'

feature "User can log in or sign up" do

  scenario "User can sign up sucessfully" do
    user = FactoryGirl.create(:user)
    visit root_path

    click_on("Sign Up")

    fill_in("First Name"), with: user.first_name
    fill_in("Last Name"), with: user.last_name
    fill_in("Email"), with: user.email
    fill_in("Password"), with: user.password
    fill_in("Password confirmation"), with: user.password

    click_button("Submit")

    expect(page).to have_content("Thanks for signing up!")
    expect(page).to have_content("Sign Out")
  end

  scenario "User does not fill out the form correctly" do
    user = FactoryGirl.create(:user)
    visit root_path

    click_on("Sign Up")

    fill_in("First Name"), with: user.first_name
    fill_in("Last Name"), with: user.last_name
    fill_in("Password"), with: user.password
    fill_in("Password confirmation"), with: user.password

    click_button("Submit")

    expect(page).to have_content("Im sorry, that didn't go through!")
    expect(page).to have_content("must specify an email")
    expect(page).to_not have_content("Thanks for signing up!")

  end
end
