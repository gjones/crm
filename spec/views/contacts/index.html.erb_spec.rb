require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :firstname => "Firstname",
        :surname => "Surname",
        :job_title => "Job Title",
        :website => "Website",
        :primary_phone => 2,
        :email => "Email",
        :bio => "MyText",
        :address_street => "Address Street",
        :address_street2 => "Address Street2",
        :address_city => "Address City",
        :address_state => "Address State",
        :address_postcode => "Address Postcode",
        :address_country => "Address Country",
        :referred_by => "Referred By",
        :twitter => "Twitter",
        :linkedin => "Linkedin"
      ),
      Contact.create!(
        :firstname => "Firstname",
        :surname => "Surname",
        :job_title => "Job Title",
        :website => "Website",
        :primary_phone => 2,
        :email => "Email",
        :bio => "MyText",
        :address_street => "Address Street",
        :address_street2 => "Address Street2",
        :address_city => "Address City",
        :address_state => "Address State",
        :address_postcode => "Address Postcode",
        :address_country => "Address Country",
        :referred_by => "Referred By",
        :twitter => "Twitter",
        :linkedin => "Linkedin"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => "Job Title".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Address Street".to_s, :count => 2
    assert_select "tr>td", :text => "Address Street2".to_s, :count => 2
    assert_select "tr>td", :text => "Address City".to_s, :count => 2
    assert_select "tr>td", :text => "Address State".to_s, :count => 2
    assert_select "tr>td", :text => "Address Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "Address Country".to_s, :count => 2
    assert_select "tr>td", :text => "Referred By".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Linkedin".to_s, :count => 2
  end
end
