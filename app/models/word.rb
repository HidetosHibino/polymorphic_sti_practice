class Word < ApplicationRecord
  include Notable
  include Ratable

  # relation about Reaction(sti)
    has_many :reactions
    has_many :meanings
    has_many :samples
    has_many :sounds
    has_many :similars

  def note_title
    "word: #{name}"
  end
end
