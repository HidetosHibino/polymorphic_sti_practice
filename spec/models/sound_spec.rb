require 'rails_helper'

RSpec.describe Sound, type: :model do
  let(:word) { create(:word) }
  
  describe 'validation' do
    it 'is valid sound' do
      sound = build(:sound, word: word)
      expect(sound).to be_valid
      expect(sound.errors).to be_empty
      assert_equal(sound.word, word)
    end

    it 'is not valid with no body' do
      sound = build(:sound, word: word, body: '')
      expect(sound).to be_invalid
    end
  end

  describe 'reference' do
    it 'word can refer its sample' do
      sound = create(:sound, word: word)
      assert_equal(word.sounds[0], sound)
    end
  end
end
