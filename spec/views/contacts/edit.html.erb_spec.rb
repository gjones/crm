require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :firstname => "MyString",
      :surname => "MyString",
      :job_title => "MyString",
      :website => "MyString",
      :primary_phone => 1,
      :email => "MyString",
      :bio => "MyText",
      :address_street => "MyString",
      :address_street2 => "MyString",
      :address_city => "MyString",
      :address_state => "MyString",
      :address_postcode => "MyString",
      :address_country => "MyString",
      :referred_by => "MyString",
      :twitter => "MyString",
      :linkedin => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input#contact_firstname[name=?]", "contact[firstname]"

      assert_select "input#contact_surname[name=?]", "contact[surname]"

      assert_select "input#contact_job_title[name=?]", "contact[job_title]"

      assert_select "input#contact_website[name=?]", "contact[website]"

      assert_select "input#contact_primary_phone[name=?]", "contact[primary_phone]"

      assert_select "input#contact_email[name=?]", "contact[email]"

      assert_select "textarea#contact_bio[name=?]", "contact[bio]"

      assert_select "input#contact_address_street[name=?]", "contact[address_street]"

      assert_select "input#contact_address_street2[name=?]", "contact[address_street2]"

      assert_select "input#contact_address_city[name=?]", "contact[address_city]"

      assert_select "input#contact_address_state[name=?]", "contact[address_state]"

      assert_select "input#contact_address_postcode[name=?]", "contact[address_postcode]"

      assert_select "input#contact_address_country[name=?]", "contact[address_country]"

      assert_select "input#contact_referred_by[name=?]", "contact[referred_by]"

      assert_select "input#contact_twitter[name=?]", "contact[twitter]"

      assert_select "input#contact_linkedin[name=?]", "contact[linkedin]"
    end
  end
end
