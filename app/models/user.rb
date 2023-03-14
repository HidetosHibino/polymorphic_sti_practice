class User < ApplicationRecord
  include Notable

  # relation about Note(polymorphic)
    has_many :notes_I_wrote, class_name: 'Note', foreign_key: 'author_id'
    # check difference between "User.notes" and "User.notes_I_wrote"
    has_many :user_notes_I_wrote, -> { where notable_type: 'User'}, class_name: 'Note', foreign_key: 'author_id'
    has_many :word_notes_I_wrote, -> { where notable_type: 'Word'}, class_name: 'Note', foreign_key: 'author_id'
    has_many :question_notes_I_wrote, -> { where notable_type: 'Question'}, class_name: 'Note', foreign_key: 'author_id'

    has_many :users_I_wrote_note_about,  through: :notes_I_wrote,  :source => :notable, :source_type => 'User'
    has_many :words_I_wrote_note_about,  through: :notes_I_wrote,  source: :notable, :source_type => 'Word'
    has_many :questions_I_wrote_note_about,  through: :notes_I_wrote,  source: :notable, source_type: 'Question'

  def note_title
    "#{first_name} #{last_name}"
  end
end
