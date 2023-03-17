require 'rails_helper'

RSpec.describe 'usefuls', type: :system do
  let!(:sample) { create(:sample) }

  describe 'usefulの作成' do

    it 'usefulの作成に成功する' do
      user = create(:user)
      visit new_sample_useful_path(sample)
      click_button 'Create Useful'
      expect(page).to have_content 'Useful was successfully created.'
      expect(page).to have_content "Useful_by User:#{user.note_title}"
      expect(current_path).to eq word_path(sample.word)
    end

    it 'UserなしでUsefulの作成に失敗する' do
      visit new_sample_useful_path(sample)
      expect do
        click_button 'Create Useful'
        expect(page).to have_content 'Fail creating Useful'
      end.to raise_error(NoMethodError)
    end

  end

  describe '画面表示' do 
    
    let!(:useful) { create(:useful) }
    it 'word画面での表示確認' do
      visit word_path(useful.sample.word)
      expect(page).to have_content "Useful_by User:#{useful.user.note_title}"
    end

    it 'useful_indexでの表示確認' do
      visit usefuls_path
      expect(page).to have_content "Word: #{useful.sample.word.name}"
      expect(page).to have_content "Sample: #{useful.sample.body}"
      expect(page).to have_content "User: #{useful.user.note_title}"
    end
  end
end