class Tenant < ApplicationRecord
  has_many :users
  has_many :contacts
  has_many :notes
  has_many :tasks
  after_create :create_tenant

  extend FriendlyId
  friendly_id :name, use: :slugged

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

end
