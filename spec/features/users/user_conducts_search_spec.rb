require "rails_helper"

feature 'User conducts search' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario "types in seach query" do
    sign_in_with user.email, user.password
    fill_in "query", with: "peter"
    visit search_index_path
    expect(page).to have_content "Results for"
  end

end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end
