require 'rails_helper'

RSpec.describe GoodRate, type: :model do
  let(:user) { create(:user) }
  let(:word) { create(:word) }
  let(:other_user) { create(:user) }

  describe 'validation' do
    context 'user_good_rate' do
      
      it 'is valid user_good_rate' do
        user_good_rate = build(:user_good_rate, ratable: user)
        expect(user_good_rate).to be_valid
        expect(user_good_rate.errors).to be_empty
        assert_equal(user_good_rate.ratable, user)
      end

      it 'unique validation' do
        user_good_rate = create(:user_good_rate, ratable: user, voter: user)
        otheruser_good_rate = build(:user_good_rate, ratable: other_user, voter: user )
        expect(otheruser_good_rate).to be_valid
        expect(otheruser_good_rate.errors).to be_empty
        otherratable_good_rate = build(:word_good_rate, ratable: word, voter:user )
        expect(otherratable_good_rate).to be_valid
        expect(otherratable_good_rate.errors).to be_empty
        othervoter_good_rate = build(:user_good_rate, ratable: user, voter:other_user )
        expect(othervoter_good_rate).to be_valid
        expect(othervoter_good_rate.errors).to be_empty
        user_bad_rate = build(:user_bad_rate, ratable: user, voter: user)
        expect(user_bad_rate).to be_valid
        expect(user_bad_rate.errors).to be_empty
      end

      it 'validation unique' do
        user_good_rate = create(:user_good_rate, ratable: user, voter: user)
        another_user_good_rate = build(:user_good_rate, ratable: user, voter: user)
        expect(another_user_good_rate).to be_invalid
      end
    end

    context 'word_good_rate' do
      let(:other_word) { create(:word) }
      it 'is valid word_good_rate' do
        word_good_rate = build(:word_good_rate, ratable: word)
        expect(word_good_rate).to be_valid
        expect(word_good_rate.errors).to be_empty
        assert_equal(word_good_rate.ratable, word)
      end

      it 'unique validation' do
        word_good_rate = create(:word_good_rate, ratable: word, voter: user)
        otherword_good_rate = build(:word_good_rate, ratable: other_word, voter: user )
        expect(otherword_good_rate).to be_valid
        expect(otherword_good_rate.errors).to be_empty
        otherratable_good_rate = build(:user_good_rate, ratable: user, voter:user )
        expect(otherratable_good_rate).to be_valid
        expect(otherratable_good_rate.errors).to be_empty
        othervoter_good_rate = build(:word_good_rate, ratable: word, voter:other_user )
        expect(othervoter_good_rate).to be_valid
        expect(othervoter_good_rate.errors).to be_empty
        word_bad_rate = build(:word_bad_rate, ratable: word, voter: user)
        expect(word_bad_rate).to be_valid
        expect(word_bad_rate.errors).to be_empty
      end

      it 'validation unique' do
        word_good_rate = create(:word_good_rate, ratable: word, voter: user)
        another_word_good_rate = build(:word_good_rate, ratable: word, voter: user)
        expect(another_word_good_rate).to be_invalid
      end
    end
  end

  describe 'reference' do
    it 'able to refer about user_good_rate' do
      user_good_rate = create(:user_good_rate, ratable: user, voter: other_user)
      assert_equal(user.rates[0], user_good_rate)
      assert_equal(other_user.rates_I_voted[0], user_good_rate)
    end

    it 'able to refer about word_good_rate' do
      word_good_rate = create(:word_good_rate, ratable: word, voter: user)
      assert_equal(word.rates[0], word_good_rate)
      assert_equal(user.rates_I_voted[0], word_good_rate)
    end
  end
end
