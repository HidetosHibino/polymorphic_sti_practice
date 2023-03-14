class Question < ApplicationRecord
  include Notable

  def note_title
    "Q: #{title}"
  end
end
