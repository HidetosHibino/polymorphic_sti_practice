require 'rails_helper'

RSpec.describe BadRate, type: :model do
  let(:user) { create(:user) }
  let(:word) { create(:word) }
  let(:other_user) { create(:user) }

  describe 'validation' do
    context 'user_bad_rate' do
      
      it 'is valid user_bad_rate' do
        user_bad_rate = build(:user_bad_rate, ratable: user)
        expect(user_bad_rate).to be_valid
        expect(user_bad_rate.errors).to be_empty
        assert_equal(user_bad_rate.ratable, user)
      end

      it 'unique validation' do
        user_bad_rate = create(:user_bad_rate, ratable: user, voter: user)
        otheruser_bad_rate = build(:user_bad_rate, ratable: other_user, voter: user )
        expect(otheruser_bad_rate).to be_valid
        expect(otheruser_bad_rate.errors).to be_empty
        otherratable_bad_rate = build(:word_bad_rate, ratable: word, voter:user )
        expect(otherratable_bad_rate).to be_valid
        expect(otherratable_bad_rate.errors).to be_empty
        othervoter_bad_rate = build(:user_bad_rate, ratable: user, voter:other_user )
        expect(othervoter_bad_rate).to be_valid
        expect(othervoter_bad_rate.errors).to be_empty
        user_good_rate = build(:user_good_rate, ratable: user, voter: user)
        expect(user_good_rate).to be_valid
        expect(user_good_rate.errors).to be_empty
      end

      it 'validation unique' do
        user_bad_rate = create(:user_bad_rate, ratable: user, voter: user)
        another_user_bad_rate = build(:user_bad_rate, ratable: user, voter: user)
        expect(another_user_bad_rate).to be_invalid
      end
    end

    context 'word_bad_rate' do
      let(:other_word) { create(:word) }
      it 'is valid word_bad_rate' do
        word_bad_rate = build(:word_bad_rate, ratable: word)
        expect(word_bad_rate).to be_valid
        expect(word_bad_rate.errors).to be_empty
        assert_equal(word_bad_rate.ratable, word)
      end

      it 'unique validation' do
        word_bad_rate = create(:word_bad_rate, ratable: word, voter: user)
        otherword_bad_rate = build(:word_bad_rate, ratable: other_word, voter: user )
        expect(otherword_bad_rate).to be_valid
        expect(otherword_bad_rate.errors).to be_empty
        otherratable_bad_rate = build(:user_bad_rate, ratable: user, voter:user )
        expect(otherratable_bad_rate).to be_valid
        expect(otherratable_bad_rate.errors).to be_empty
        othervoter_bad_rate = build(:word_bad_rate, ratable: word, voter:other_user )
        expect(othervoter_bad_rate).to be_valid
        expect(othervoter_bad_rate.errors).to be_empty
        word_good_rate = build(:word_good_rate, ratable: word, voter: user)
        expect(word_good_rate).to be_valid
        expect(word_good_rate.errors).to be_empty
      end

      it 'validation unique' do
        word_bad_rate = create(:word_bad_rate, ratable: word, voter: user)
        another_word_bad_rate = build(:word_bad_rate, ratable: word, voter: user)
        expect(another_word_bad_rate).to be_invalid
      end
    end
  end

  describe 'reference' do
    it 'able to refer about user_bad_rate' do
      user_bad_rate = create(:user_bad_rate, ratable: user, voter: other_user)
      assert_equal(user.rates[0], user_bad_rate)
      assert_equal(other_user.rates_I_voted[0], user_bad_rate)
    end

    it 'able to refer about word_bad_rate' do
      word_bad_rate = create(:word_bad_rate, ratable: word, voter: user)
      assert_equal(word.rates[0], word_bad_rate)
      assert_equal(user.rates_I_voted[0], word_bad_rate)
    end
  end
end
