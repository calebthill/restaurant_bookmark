require 'rails_helper'

feature "User can log in or sign up" do

  scenario "User can sign up sucessfully" do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path

    click_link "Sign Up"

    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: "calebnthill123456@gmail.com"
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password

    click_button("Sign Up")

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "User does not enter email" do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path

    click_on "Sign Up"

    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    within ".btn btn-default" do
      click_button("Sign Up")
    end

    expect(page).to have_content("Email can't be blank")
    expect(page).to_not have_content("Thanks for signing up!")
  end

  scenario "User passwords do not match" do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path

    click_on "Sign Up"

    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: "calebnthill123456@gmail.com"
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: "wrong_password"

    within ".btn btn-default" do
      click_button("Sign Up")
    end

    expect(page).to have_content("Password confirmation doesn't match")
    expect(page).to_not have_content("Thanks for signing up!")
  end
end
