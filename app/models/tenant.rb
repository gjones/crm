class Tenant < ApplicationRecord
  has_many :users
  has_many :contacts
  has_many :notes
  has_many :tasks

  EXCLUDED_SUBDOMAINS = %w(admin www administrator admins owner)

  validates_exclusion_of :subdomain, in: EXCLUDED_SUBDOMAINS,
  message: "is not allowed. Please choose another subdomain"

  validates_format_of :subdomain, with: /\A[\w\-]+\Z/i, allow_blank: true,
  message: "is not allowed. Please choose another subdomain."

  validates :subdomain, presence: true, uniqueness: true

  before_validation do
    self.subdomain = subdomain.to_s.downcase
  end
end
