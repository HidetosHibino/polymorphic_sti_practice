class User < ApplicationRecord
  include Notable
  include Ratable

  # relation about Note(polymorphic)
    has_many :notes_I_wrote, class_name: 'Note', foreign_key: 'author_id', dependent: :destroy
    # check difference between "User.notes" and "User.notes_I_wrote"
    has_many :user_notes_I_wrote, -> { where notable_type: 'User'}, class_name: 'Note', foreign_key: 'author_id', dependent: :destroy
    has_many :word_notes_I_wrote, -> { where notable_type: 'Word'}, class_name: 'Note', foreign_key: 'author_id', dependent: :destroy
    has_many :question_notes_I_wrote, -> { where notable_type: 'Question'}, class_name: 'Note', foreign_key: 'author_id', dependent: :destroy

    has_many :users_I_wrote_note_about,  through: :notes_I_wrote,  :source => :notable, :source_type => 'User'
    has_many :words_I_wrote_note_about,  through: :notes_I_wrote,  source: :notable, :source_type => 'Word'
    has_many :questions_I_wrote_note_about,  through: :notes_I_wrote,  source: :notable, source_type: 'Question'

    has_many :usefuls, dependent: :destroy

    # relation about rate (as voter)
    has_many :rates_I_voted, class_name: 'Rate', foreign_key: 'voter_id', dependent: :destroy
    has_many :good_rates_I_voted, class_name: 'GoodRate', foreign_key: 'voter_id', dependent: :destroy
    has_many :bad_rates_I_voted, class_name: 'BadRate', foreign_key: 'voter_id', dependent: :destroy

    has_many :good_rates_to_user_I_voted, -> {where ratable_type: 'User'},  class_name: 'GoodRate', foreign_key: 'voter_id', dependent: :destroy
    has_many :bad_rates_to_user_I_voted, -> { where ratable_type: 'User'}, class_name: 'BadRate', foreign_key: 'voter_id', dependent: :destroy

    has_many :good_rates_to_word_I_voted, -> {where ratable_type: 'Word'},  class_name: 'GoodRate', foreign_key: 'voter_id', dependent: :destroy
    has_many :bad_rates_to_word_I_voted, -> { where ratable_type: 'Word'}, class_name: 'BadRate', foreign_key: 'voter_id', dependent: :destroy
    
    # 意図した選択でない(SELECT "users".* FROM "users" INNER JOIN "rates" ON "users"."id" = "rates"."ratable_id" WHERE "rates"."ratable_id" = ? AND "rates"."ratable_type" = ?  [["ratable_id", 1], ["ratable_type", "User"]] )
    # 中間テーブル<Rate>に対してforeign_key: 'voter_id'　を指定しなければならないため
    # has_many :users_I_voted_rate_to, through: :rates, foreign_key: 'voter_id', source: :ratable ,:source_type => 'User' 
    # has_many :users_I_voted_good_rate_to, through: :good_rates, foreign_key: 'voter_id', source: :ratable, :source_type => 'User' 

    has_many :users_I_voted_rate_to, through: :rates_I_voted, source: :ratable, source_type: 'User'
    has_many :users_I_voted_good_rate_to, through: :good_rates_I_voted, source: :ratable, source_type: 'User'
    has_many :users_I_voted_bad_rate_to, through: :bad_rates_I_voted, source: :ratable, source_type: 'User'

    has_many :words_I_voted_rate_to, through: :rates_I_voted, source: :ratable, source_type: 'Word'
    has_many :words_I_voted_good_rate_to, through: :good_rates_I_voted, source: :ratable, source_type: 'Word'
    has_many :words_I_voted_bad_rate_to, through: :bad_rates_I_voted, source: :ratable, source_type: 'Word'
    
  def note_title
    "#{first_name} #{last_name}"
  end
end
