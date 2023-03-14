require 'rails_helper'

RSpec.describe 'questions_notes', type: :system do
  let(:question) { create(:question) }
  let(:note) { create(:question_note, notable: question) }

  describe 'question_noteの作成' do
    let!(:user) { create(:user) }
    context 'question_noteの作成' do
      before { visit new_question_note_path(question) }

      it 'queston_noteの作成に成功する' do
        fill_in 'Body', with: 'test_question_note'
        click_button 'Create Note'
        expect(page).to have_content 'Note was successfully created.'
        expect(page).to have_content "Q: #{question.title}"
        expect(page).to have_content 'test_question_note'
        expect(current_path).to eq question_path(question)
      end

      it 'bodyなしでquestion_noteの作成に失敗する' do
        click_button 'Create Note'
        expect(page).to have_content 'failed creating Note'
        expect(current_path).to eq new_question_note_path(question)
      end
    end
  end

  describe 'questionごとのquestion_noteの表示' do
    context 'question_noteの表示' do
      let!(:other_question) { create(:question) }
      let!(:other_note){ create(:question_note, notable: other_question) }
 
      it 'questionに紐づいたquestion_noteが表示される' do
        visit question_path(other_question)
        expect(page).to have_content 'question_note_body'
      end

      it '他questionに紐づいたquestion_noteは表示されない' do
        visit question_path(question)
        expect(page).not_to have_content 'question_note_body'
      end
    end
  end

  describe 'note_indexに表示されること' do
    let!(:question_note) { create(:question_note, notable: question) }
    before { visit notes_path }

    it 'indexに表示されること' do
      expect(page).to have_content 'question_note_body'
    end

    it 'question_pathへのリンクが機能すること' do
      click_link 'Show this notable'
      expect(current_path).to eq question_path(question)
    end
  end
end