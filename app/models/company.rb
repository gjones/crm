class Company < ApplicationRecord
  has_many :users
  has_many :contacts

  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :logo, LogoUploader
end
