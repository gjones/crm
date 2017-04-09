require "rails_helper"

feature "Contact scoping" do
  fixtures :all

  scenario "display's only User A's records" do
    sign_in_with "user_a@example.com", "password"
    visit contacts_url
    expect(page).to have_content "This contact belongs to Company A"
    expect(page).not_to have_content "This contact belongs to Company B"
  end

  scenario "display's only user B's records" do
    sign_in_with "user_b@example.com", "password"
    visit contacts_url
    expect(page).to have_content "This contact belongs to Company B"
    expect(page).not_to have_content "This contact belongs to Company A"
  end
end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end
