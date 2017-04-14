require "rails_helper"

feature 'User views contacts' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario "views a list of contacts" do
    sign_in_with user.email, user.password
    visit contacts_path
    expect(page).to have_content "Contacts"
  end

end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end
