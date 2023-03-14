class Word < ApplicationRecord
  include Notable

  def note_title
    "word: #{name}"
  end
end
