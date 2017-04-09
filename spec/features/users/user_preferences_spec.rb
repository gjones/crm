require "rails_helper"

feature 'User enters preferences settings' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario "access preferences page" do
    sign_in_with user.email, user.password
    click_link 'Preferences'
    visit preferences_path(user)
  end

  scenario "change sidebar colour to white" do
    sign_in_with user.email, user.password
    visit preferences_path(user)
    select('white', :from => 'Theme')
    click_button 'Update Theme'
    expect(page).to have_content "User was successfully updated."
  end

end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end
