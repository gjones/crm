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
    choose('user_theme_white')
    click_button 'Update Preferences'
    expect(page).to have_content "User was successfully updated."
  end

end

feature 'User updates their account details' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario "changes first name" do
    sign_in_with user.email, user.password
    visit preferences_path(user)
    choose('tab2')
    fill_in "Firstname", with: 'Reginald'
    click_button "Update User"
    expect(page).to have_content("User was successfully updated.")
    choose('tab2')
    expect(page).to have_content("Reginald")
  end

  scenario "changes last name" do
    sign_in_with user.email, user.password
    visit preferences_path(user)
    choose('tab2')
    fill_in "Surname", with: 'Perrin'
    click_button "Update User"
    expect(page).to have_content("User was successfully updated.")
    choose('tab2')
    expect(page).to have_content("Perrin")
  end

  scenario "changes email" do
    sign_in_with user.email, user.password
    visit preferences_path(user)
    choose('tab2')
    fill_in "Email", with: 'johndirtdog@hotmail.com'
    click_button "Update User"
    expect(page).to have_content("User was successfully updated.")
    choose('tab2')
    # expect(page).to have_content("johndirtdog@hotmail.com")
  end

  scenario "changes role" do
    sign_in_with user.email, user.password
    visit preferences_path(user)
    choose('tab2')
    select('admin', :from => 'Role')
    click_button "Update User"
    expect(page).to have_content("User was successfully updated.")
    choose('tab2')
    expect(page).to have_content("admin")
  end

  scenario "changes title" do
    sign_in_with user.email, user.password
    visit preferences_path(user)
    choose('tab2')
    fill_in 'Title', with: 'Assistant Manager'
    click_button 'Update User'
    expect(page).to have_content("User was successfully updated.")
    choose('tab2')
    # expect(page).to have_content("Assistant Manager")
  end

end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end
