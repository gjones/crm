class Contact < ApplicationRecord
  belongs_to :tenant
  has_many :notes
  has_many :tasks
  accepts_nested_attributes_for :tasks

  include PgSearch
  multisearchable :against => [:firstname, :surname]
  extend FriendlyId

  def name
    "#{self.firstname} #{self.surname}"
  end

  def age(birthday)
    (Time.now.to_s(:number).to_i - birthday.to_time.to_s(:number).to_i)/10e9.to_i
  end

  def full_age
    "#{self.birthday.strftime('%e %B, %Y')} (#{self.age(self.birthday)} years old)"
  end

  def address
    @address_array = [self.address_street, self.address_street2, self.address_city, self.address_state, self.address_country, self.address_postcode]
    @address_array.reject(&:blank?).join(", ")
  end

  def work_address
    @work_address_array = [self.work_address_street, self.work_address_street2, self.work_address_city, self.work_address_state, self.work_address_country, self.work_address_postcode]
    @work_address_array.reject(&:blank?).join(", ")
  end

  def location
    @location_array = [self.address_city, self.address_state, self.address_country]
    @location_array.reject(&:blank?).join(", ")
  end

  friendly_id :name, use: :slugged
  geocoded_by :address
  after_validation :geocode

end
