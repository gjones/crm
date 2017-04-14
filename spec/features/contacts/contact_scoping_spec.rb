require "rails_helper"

feature "Contact scoping" do
  company_a = FactoryGirl.create(:company, :name => 'company_a', :id => "123")
  company_b = FactoryGirl.create(:company, :name => 'company_b', :id => "456")

  user_a = FactoryGirl.create(:user, :email => Faker::Internet.email, :company => Company.find_by(:name => "company_a"))
  user_b = FactoryGirl.create(:user, :email => Faker::Internet.email, :company => Company.find_by(:name => "company_b"))

  contact_a = FactoryGirl.create(:contact, :firstname => 'John From Company A', :surname => 'Rotten', :company => Company.find_by(:name => "company_a"))
  contact_b = FactoryGirl.create(:contact, :firstname => 'Nick From Company B', :surname => 'Todd', :company => Company.find_by(:name => "company_b"))

  scenario "display's only User A's records" do
    sign_in_with user_a.email, user_a.password
    create_contact_with contact_a.firstname, contact_a.surname, contact_a.company
    click_link 'Contacts'
    expect(page).to have_content "John From Company A"
    expect(page).not_to have_content "Nick From Company B"
  end

  scenario "display's only User B's records" do
    sign_in_with user_b.email, user_b.password
    create_contact_with contact_b.firstname, contact_b.surname, contact_b.company
    click_link 'Contacts'
    expect(page).to have_content "Nick From Company B"
    expect(page).not_to have_content "John From Company A"
  end
end

def sign_in_with(email, password)
  visit new_user_session_path
  fill_in 'Email', with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end

def create_contact_with(firstname, surname, company)
  visit new_contact_path
  fill_in 'Firstname', with: firstname
  fill_in 'Surname', with: surname
  fill_in 'contact_company_id', with: company.id
  click_button 'Create Contact'
  expect(page).to have_content 'Contact was successfully created.'
end
