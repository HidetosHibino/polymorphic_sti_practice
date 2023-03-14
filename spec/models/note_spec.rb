require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { create(:user) }
  let(:word) { create(:word) }
  let(:question) {create(:question)}

  describe 'validation' do
    context 'user_note' do
      it 'is valid user_note' do
        user_note = build(:user_note, notable: user)
        expect(user_note).to be_valid
        expect(user_note.errors).to be_empty
        assert_equal(user_note.notable, user)
      end

      it 'able to refer from user' do
        user_note = create(:user_note, notable: user)
        assert_equal(user.notes[0], user_note)
      end
    end

    context 'word_note' do
      it 'is valid word_note' do
        word_note = build(:word_note, notable: word)
        expect(word_note).to be_valid
        expect(word_note.errors).to be_empty
        assert_equal(word_note.notable, word)
      end

      it 'able to refer from word' do
        word_note = create(:word_note, notable:word)
        assert_equal(word.notes[0], word_note)
      end
    end

    context 'question_note' do
      it 'is valid question_note' do
        question_note = build(:question_note, notable: question)
        expect(question_note).to be_valid
        expect(question_note.errors).to be_empty
        assert_equal(question_note.notable, question)
      end

      it 'able to refer from question' do
        question_note = create(:question_note, notable: question)
        assert_equal(question.notes[0], question_note)
      end
    end
  end

  describe 'reference' do
    let(:author_user) { create(:user) }
    context 'user-notes.author' do
      it 'able to refer user(as notable_ogj) from author' do
        user_note = create(:user_note, notable: user, author: author_user)
        assert_equal(author_user.user_notes_I_wrote[0], user_note)
        assert_equal(author_user.users_I_wrote_note_about[0], user)
        refute_equal(author_user, user)
      end

      it 'able to refer author from user(as notable_obj)' do
        user_note = create(:user_note, notable: user, author: author_user)
        assert_equal(user.note_authors[0], author_user)
        refute_equal(author_user, user)
      end
    end

    context 'word-notes.author' do
      it 'able to refer word(as notable_ogj) from author' do
        author_user = create(:user)
        word_note = create(:word_note, notable: word, author: author_user)
        assert_equal(author_user.word_notes_I_wrote[0], word_note)
        assert_equal(author_user.words_I_wrote_note_about[0], word)
      end

      it 'able to refer author from word(as notable_obj)' do
        author_user = create(:user)
        word_note = create(:word_note, notable: word, author: author_user)
        assert_equal(word.note_authors[0], author_user)
      end
    end

    context 'question-notes.author' do
      it 'able to refer question(as notable_ogj) from author' do
        author_user = create(:user)
        question_note = create(:question_note, notable: question, author: author_user)
        assert_equal(author_user.notes_I_wrote[0], question_note)
        assert_equal(author_user.question_notes_I_wrote[0], question_note)
        assert_equal(author_user.questions_I_wrote_note_about[0], question)
      end

      it 'able to refer author from question(as notable_obj)' do
        author_user = create(:user)
        question_note = create(:question_note, notable: question, author: author_user)
        assert_equal(question.note_authors[0], author_user)
      end
    end
  end




  it 'must_Implemente_methods' do
    # 定数オブジェクトの一覧を取得。
    constants = Object.constants.map do |name|
      Object.const_get(name)
    end
    # Noteモデルと紐づいているモデルを取得する
    models = constants.select do |c|
      # モデルクラスを絞り込む
      next unless c.class == Class && c < ActiveRecord::Base && !c.abstract_class? 
      # Noteモデルが紐づいているか絞り込む
      c.reflect_on_all_associations.map(&:name).include?(:notes)
    end
    models.each do |model|
      # 定義されたメソッドがあるかを確認する
      expect(model.method_defined?(:note_title, false)).to be true
    end
  end
end
