require "rails_helper"

feature 'User signs in' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario 'with valid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    check 'Remember me'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'without valid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: ""
    fill_in 'Password', with: user.password
    check 'Remember me'
    click_button 'Sign in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'already has an account' do
    visit new_user_session_path
    click_link 'Register for a new account'
    expect(page).to have_content 'Register'
  end

  scenario 'forgets password' do
    visit new_user_session_path
    check 'Remember me'
    click_link 'Forgot password?'
    expect(page).to have_content 'Forgot your password?'
  end

  scenario 'requests reset password with valid email' do
    visit new_user_password_path
    fill_in 'Email', with: user.email
    click_button 'Send me reset password instructions'
    expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
  end

  scenario 'requests reset password with invalid email' do
    visit new_user_password_path
    fill_in 'Email', with: ''
    click_button 'Send me reset password instructions'
    expect(page).to have_content "Email can't be blank"
  end

end

