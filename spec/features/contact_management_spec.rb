require "rails_helper"

feature "Contact management" do
  fixtures :all

  scenario "can't create new contact without firstname" do
    sign_in_with "user_a@example.com", "password"
    create_contact_with "", "Ronaldo"
    expect(page).to have_content "error prohibited this contact from being saved"
  end

  scenario "can't create new contact without surname" do
    sign_in_with "user_a@example.com", "password"
    create_contact_with "Cristiano", ""
    expect(page).to have_content "error prohibited this contact from being saved"
  end

  scenario "creates a new contact" do
    sign_in_with "user_a@example.com", "password"
    create_contact_with "Cristiano", "Ronaldo"
    visit(@contact)
    expect(page).to have_content "Cristiano"
  end
end

def create_contact_with(firstname, surname)
  visit new_contact_path
  fill_in "contact_firstname", with: firstname
  fill_in "contact_surname", with: surname
  click_button "Create Contact"
end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end
