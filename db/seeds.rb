# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

companies = Company.create([
  {id: "3dac2027-0598-47b6-a488-3030d15789c2", name: "Cardiff City", slug: "cardiff-city", created_at: "2017-04-07 04:13:48", updated_at: "2017-04-07 04:13:48"},
  {id: "cfcb7901-34bb-4c2c-8076-6c15d7bbb7b4", name: "Welsh Rugby Union", slug: "welsh-rugby-union", created_at: "2017-04-07 04:13:55", updated_at: "2017-04-07 04:13:55"}
])
