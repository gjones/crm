class Contact < ApplicationRecord
  belongs_to :company
  has_many :notes
  has_many :tasks
  accepts_nested_attributes_for :tasks
  mount_uploader :image, ImageUploader
  include PgSearch
  #multisearchable :against => [:firstname, :surname]
  pg_search_scope :search_by_full_name, :against => [:firstname, :surname]
  extend FriendlyId

  validates_presence_of :firstname
  validates_presence_of :surname
  scope :alphabetical, -> {
   order('surname asc')
  }

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

  def address_line1
    @address_array = [self.address_street, self.address_street2]
    @address_array.reject(&:blank?).join(", ")
  end

  def address_line2
    @address_array = [self.address_city, self.address_state]
    @address_array.reject(&:blank?).join(", ")
  end

  def address_line3
    @address_array = [self.address_postcode, self.address_country]
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
