require "rails_helper"

feature "User Creates Contact" do
  given!(:company) { FactoryGirl.create(:company, :name => 'company_a', :id => "123") }
  given!(:user) { FactoryGirl.create(:user, :email => Faker::Internet.email,  :company => Company.find_by(:name => "company_a")) }
  given!(:contact) { FactoryGirl.create(:contact, :firstname => 'Mike', :surname => 'Milner', :company => Company.find_by(:name => "company_a")) }

  scenario "with valid credentials" do
    sign_in_with user.email, user.password
    visit new_contact_path
    fill_in 'Firstname', with: contact.firstname
    fill_in 'Surname', with: contact.surname
    fill_in 'contact_company_id', with: contact.company.id
    click_button 'Create Contact'
    expect(page).to have_content 'Contact was successfully created.'
    click_link 'Contacts'
    expect(page).to have_content contact.firstname
  end

  scenario "without valid credentials" do
    sign_in_with user.email, user.password
    visit new_contact_path
    fill_in 'Firstname', with: ""
    fill_in 'Surname', with: contact.surname
    fill_in 'contact_company_id', with: contact.company.id
    click_button 'Create Contact'
    expect(page).to have_content "Firstname can't be blank"
  end

end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  check 'Remember me'
  click_button 'Sign in'
  expect(page).to have_content 'Signed in successfully.'
end
