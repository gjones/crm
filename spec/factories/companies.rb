FactoryGirl.define do
  factory :company do
    name "MyString"
    id "435346346-663463463"
    slug "MyString"
    logo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'brands', 'logos', 'logo_image.jpg'), 'image/jpg') }
  end
end
