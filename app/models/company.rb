class Company < ApplicationRecord
  has_many :users
  has_many :contacts

  extend FriendlyId
  friendly_id :name, use: :slugged
end
