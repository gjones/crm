require "rails_helper"

feature 'User registers account' do
  given!(:user) { FactoryGirl.create(:user) }
  given!(:company) { FactoryGirl.create(:company) }

  scenario 'with valid credentials' do
    visit new_user_registration_path
    fill_in 'Email', with: Faker::Internet.email
    select(company.name, :from => 'Company')
    select(user.role, :from => 'Role')
    fill_in 'password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Register'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'without valid email' do
    visit new_user_registration_path
    fill_in 'Email', with: ""
    select(company.name, :from => 'Company')
    select(user.role, :from => 'Role')
    fill_in 'password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Register'
    expect(page).to have_content "Email can't be blank"
  end

  scenario 'without password' do
    visit new_user_registration_path
    fill_in 'Email', with: Faker::Internet.email
    select(company.name, :from => 'Company')
    select(user.role, :from => 'Role')
    fill_in 'password', with: ""
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Register'
    expect(page).to have_content "Password can't be blank"
  end

  scenario 'password confirmation doesnt match password' do
    visit new_user_registration_path
    fill_in 'Email', with: Faker::Internet.email
    select(company.name, :from => 'Company')
    select(user.role, :from => 'Role')
    fill_in 'password', with: "potato123"
    fill_in 'user_password_confirmation', with: "potato456"
    click_button 'Register'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

end
