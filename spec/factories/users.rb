FactoryGirl.define do
  factory :user do
    email                  { Faker::Internet.email }
    firstname              { Faker::Name.first_name }
    surname                { Faker::Name.last_name }
    role                   "user"
    title                  { Faker::Job.title }
    password               "password"
    password_confirmation  "password"
    company_id              "124"
  end
end
