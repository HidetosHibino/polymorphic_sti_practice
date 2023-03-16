require 'rails_helper'

RSpec.describe Similar, type: :model do
  let(:word) { create(:word) }

  describe 'validation' do
    it 'is valid similar' do
      similar = build(:similar, word: word)
      expect(similar).to be_valid
      expect(similar.errors).to be_empty
      assert_equal(similar.word, word)
    end
    it 'is not valid without similar' do
      similar = build(:similar, similar: nil)
      expect(similar).to be_invalid
    end
  end

  describe 'refereces' do
    it 'refer from word' do
      similar = create(:similar, word: word)
      assert_equal(word.similars[0], similar)
    end

    it 'refer from similar_word' do
      similar_word = create(:word)
      similar = create(:similar, similar: similar_word)
      assert_equal(similar.similar, similar_word)
    end
  end
end
