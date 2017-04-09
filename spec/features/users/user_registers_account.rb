require "rails_helper"

feature 'User registers account' do
  given!(:user) { FactoryGirl.create(:user) }
  given!(:company) { FactoryGirl.create(:company) }

  scenario 'with valid credentials' do
    visit new_user_registration_path
    fill_in 'Email', with: Faker::Internet.email
    select(company.name, :from => 'Company')
    select(user.role, :from => 'Role')
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation
    click_button 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
