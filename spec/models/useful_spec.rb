require 'rails_helper'

RSpec.describe Useful, type: :model do
  let(:sample) { create(:sample) }

  describe 'validation' do
    it 'is valid useful' do
      useful = build(:useful, sample: sample)
      expect(useful).to be_valid
      expect(useful.errors).to be_empty
      assert_equal(useful.sample, sample)
    end

    it 'raise error with wrong reaction(not sample)' do
      meaning = create(:meaning)
      expect do 
        useful = build(:useful, sample: meaning)
      end.to raise_error(ActiveRecord::AssociationTypeMismatch)
    end
  end

  describe 'reference' do
    it 'sample can refer its useful' do
      useful = create(:useful, sample: sample)
      assert_equal(sample.usefuls[0], useful)
    end

    it 'user can refer its useful' do
      user = create(:user)
      useful = create(:useful, user: user)
      assert_equal(user.usefuls[0], useful)
    end
  end
end
