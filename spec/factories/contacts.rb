FactoryGirl.define do
  factory :contact do
    firstname "MyString"
    surname "MyString"
    birthday "2017-02-04"
    job_title "MyString"
    website "MyString"
    primary_phone 1
    email "MyString"
    bio "MyText"
    address_street "MyString"
    address_street2 "MyString"
    address_city "MyString"
    address_state "MyString"
    address_postcode "MyString"
    address_country "MyString"
    referred_by "MyString"
    twitter "MyString"
    linkedin "MyString"
    company "Company A"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'images', 'contacts', 'logo_image.jpg'), 'image/jpg') }
  end
end
