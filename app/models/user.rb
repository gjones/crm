class User < ApplicationRecord
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setting User Role
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Setting Sidebar Colour
  enum theme: [:dark, :light, :white]
  after_initialize :set_default_theme, :if => :new_record?

  #validates_presence_of :company_id

  def set_default_role
    self.role ||= :user
  end

  def set_default_theme
    self.theme ||= :dark
  end

  def name
    "#{self.firstname} #{self.surname}"
  end

  def member_since
    created_at.try(:strftime, "%B %e, %Y")
  end

  def last_sign_in
    last_sign_in_at.try(:strftime, "%B %e, %Y")
  end

end
