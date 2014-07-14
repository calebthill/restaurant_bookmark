module LogInHelper
  def log_in(user)
    visit root_path
    click_on 'Sign In'
    within "#login" do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end
