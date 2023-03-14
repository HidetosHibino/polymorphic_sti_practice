require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { create(:user) }
  let(:word) { create(:word) }
  let(:question) {create(:question)}

  describe 'validation' do
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
