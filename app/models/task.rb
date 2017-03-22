class Task < ApplicationRecord
  belongs_to :tenant
  belongs_to :contact

  def deadline
    start_date.try(:strftime, "%B %e, %Y")
  end
end
