class Note < ApplicationRecord
  belongs_to :contact

  def note_made_at
    created_at.try(:strftime, "%B %e, %Y")
  end

  def author_and_time
    "#{self.author}, #{note_made_at}"
  end

end
