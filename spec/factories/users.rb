FactoryGirl.define do
  factory :user do
    email                  {Faker::Internet.email}
    role                   "user"
    password               "password"
    password_confirmation  "password"
    company_id              "124"
  end
end
