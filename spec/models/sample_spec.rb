require 'rails_helper'

RSpec.describe Sample, type: :model do
  let(:word) { create(:word)}

  describe 'validation' do
    it 'is valid sample' do
      sample = build(:sample, word: word)
      expect(sample).to be_valid
      expect(sample.errors).to be_empty
      assert_equal(sample.word, word)
    end

    it 'is not valid smple without body' do
      sample = build(:sample, body: '')
      expect(sample).to be_invalid
    end
  end

  describe 'refer from word' do
    it 'word can refer its sample' do
      sample = create(:sample, word: word)
      assert_equal(word.samples[0], sample)
    end
  end
end
