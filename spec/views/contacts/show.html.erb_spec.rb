require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Job Title/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Address Street/)
    expect(rendered).to match(/Address Street2/)
    expect(rendered).to match(/Address City/)
    expect(rendered).to match(/Address State/)
    expect(rendered).to match(/Address Postcode/)
    expect(rendered).to match(/Address Country/)
    expect(rendered).to match(/Referred By/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Linkedin/)
  end
end
