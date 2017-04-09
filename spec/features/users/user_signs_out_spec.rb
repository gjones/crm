require "rails_helper"

feature 'User signs out' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario 'signs out from account' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
    click_link 'Sign Out'
    expect(page).to have_content 'Signed out successfully.'
  end
end
