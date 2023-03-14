require 'rails_helper'

RSpec.describe 'reactions', type: :system do
  let(:word) { create(:word) }

  describe 'reactionの作成' do
    context 'meaningの作成' do
      before { visit new_word_meaning_path(word) }

      it 'sampleの作成に成功する' do
        fill_in 'Body', with: 'test_meaning'
        click_button 'Create Meaning'
        expect(page).to have_content 'Meaning was successfully created.'
        expect(page).to have_content 'test_meaning'
        expect(current_path).to eq word_path(word)
      end

      it 'bodyなしでMeaningの作成に失敗する' do
        click_button 'Create Meaning'
        expect(page).to have_content 'Fail creating Meaning'
        expect(current_path).to eq new_word_meaning_path(word)
      end
    end

    context 'sampleの作成' do
      before { visit new_word_sample_path(word) }

      it 'sampleの作成に成功する' do
        fill_in 'Body', with: 'test_sample'
        click_button 'Create Sample'
        expect(page).to have_content 'Sample was successfully created.'
        expect(page).to have_content 'test_sample'
        expect(current_path).to eq word_path(word)
      end

      it 'bodyなしでSampleの作成に失敗する' do
        click_button 'Create Sample'
        expect(page).to have_content 'Fail creating Sample'
        expect(current_path).to eq new_word_sample_path(word)
      end
    end
  end

  describe '画面表示' do 
    
    context 'meaning' do
      let!(:meaning) { create(:meaning) }
      it 'reactions_indexの表示確認' do
        visit reactions_path
        expect(page).to have_content meaning.body
      end
    end

    context 'sample' do
      let!(:sample) { create(:sample) }
      it 'reactions_indexの表示確認' do
        visit reactions_path
        expect(page).to have_content sample.body
      end
    end
  end

end