# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contacts = Contact.create([
  {firstname: 'Daniel', surname: 'Abbott', birthday: '1975-02-16', email: 'danabbott52@gmail.com', primary_phone: '+44 (01253) 636025', address_street: '15 Mildenhall Road', address_city: 'Slough', address_state: 'Berkshire', address_postcode: 'SL6 4FA', address_country: 'England'},
  {firstname: 'Steve', surname: 'Allen', birthday: '1982-11-20', email: 'steveallen43@gmail.com', primary_phone: '+44 (01275) 437463', address_street: '12 Lemsford Rd', address_city: 'St. Albans', address_state: 'Hertfordshire', address_postcode: 'AL1 3PB', address_country: 'England', latitude: '51.7536423', longitude: '-0.327725'},
  {firstname: 'Louise', surname: 'Bond', birthday: '1987-05-11', email: 'lwbond_girl@yahoo.com', primary_phone: '+44 (01262) 765153', address_street: '81 Clermiston Rd', address_city: 'Edinburgh', address_state: 'Edinburgh', address_postcode: 'EH12 6UU', address_country: 'Scotland', latitude: '55.9487291', longitude: '-3.2803133'},
  {firstname: 'Craig', surname: 'Bond', birthday: '1988-12-16', email: 'craigy_b@yahoo.co.uk', primary_phone: '+44 (01262) 761361', address_street: '81 Clermiston Rd', address_city: 'Edinburgh', address_state: 'Edinburgh', address_postcode: 'EH12 6UU', address_country: 'Scotland', latitude: '55.9487291', longitude: '-3.2803133'},
  {firstname: 'Kate', surname: 'Church', birthday: '1990-12-26', email: 'katiechurch@gmail.co.uk', primary_phone: '+44 (01242) 535156', address_street: '37 Crispin Ave', address_city: 'Carmarthen', address_state: 'Carmarthenshire', address_postcode: 'SA31 3EH', address_country: 'Wales', latitude: '51.8581042', longitude: '-4.3206157'},
  {firstname: 'Paul', surname: 'Duran', birthday: '1965-10-05', email: 'mrduran@hotmail.com', primary_phone: '+44 (01533) 254235', address_street: '201 Huntingdon Rd', address_city: 'Cambridge', address_state: 'Cambridgeshire', address_postcode: 'CB3 0DL', address_country: 'England', latitude: '52.221748', longitude: '0.0951663'},
  {firstname: 'Christopher', surname: 'McGhee', birthday: '1998-11-02', email: 'contact@chrismcghee.com', primary_phone: '4401242112152', address_street: '62 Eelbrook Ave', address_street2: 'Bradwell Common', address_city: 'Milton Keynes', address_postcode: 'MK13 8RA', address_country: 'England', latitude: '52.0419244', longitude: '-0.7731239', bio: 'Junior Design at a design shop in Milton Keynes, started learning html and css during his evening and weekends. Ambitious young man.'}
])
