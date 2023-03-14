require 'rails_helper'

RSpec.describe 'word_notes', type: :system do
  let(:word) { create(:word) }
  let(:note) { create(:word_note, notable: word) }
  
  describe 'word_noteの作成' do
    context 'word_noteの作成' do
      before { visit new_word_note_path(word) }

      it 'word_noteの作成が成功する' do
        fill_in 'Body', with: 'test_word_note'
        click_button 'Create Note'
        expect(page).to have_content 'Note was successfully created.'
        expect(page).to have_content "word: #{word.name}"
        expect(page).to have_content 'test_word_note'
        expect(current_path).to eq word_path(word)
      end

      it 'bodyなしでword_noteの作成が失敗する' do
        click_button 'Create Note'
        expect(page).to have_content 'failed creating Note.'
        expect(current_path).to eq new_word_note_path(word)
      end
    end
  end

  describe 'wordごとのword_noteの表示' do
    context 'word_noteの表示' do
      let!(:other_word) { create(:word) }
      let!(:other_note) { create(:word_note, notable: other_word) }

      it 'wordに紐づいたword_noteが表示される' do
        visit word_path(other_word)
        expect(page).to have_content 'word_note'
      end

      it '他wordに紐づいたword_noteは表示されない' do
        visit word_path(word)
        expect(page).not_to have_content 'word_note'
      end
    end
  end

  describe 'note_indexに表示される' do
    let!(:note) { create(:word_note, notable: word) }
    before { visit notes_path }

    context 'word_noteの表示' do  
      it 'indexに表示されること' do
        expect(page).to have_content 'word_note'
      end
    end
    
    context 'word_noteからのリンク' do
      it 'word_noteからwordへのリンクが機能すること' do
        click_link 'Show this notable'
        expect(current_path).to eq word_path(word)
      end
    end
  end
end

