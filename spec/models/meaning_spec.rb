require 'rails_helper'

RSpec.describe Meaning, type: :model do
  let(:word) { create(:word) }

  describe 'validation' do
    it 'is valid meaning' do
      meaning = build(:meaning, word: word)
      expect(meaning).to be_valid
      expect(meaning.errors).to be_empty
      assert_equal(meaning.word, word)
    end

    it 'is not valid meaning without body' do
      meaning = build(:meaning, body: '')
      expect(meaning).to be_invalid
    end
  end

  describe 'refer from word' do
    it 'word can refer its meaninf' do
      meaning = create(:meaning, word: word)
      assert_equal(word.meanings[0], meaning)      
    end
  end
end
