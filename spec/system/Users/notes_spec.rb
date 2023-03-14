require 'rails_helper'

RSpec.describe 'user_notes', type: :system do
  let(:user) { create(:user) }
  let(:note) { create(:user_note, notable: user) }
  
  describe 'user_noteの作成' do
    context 'user_noteの作成' do
      before { visit new_user_note_path(user) }

      it 'user_noteの作成が成功する' do
        fill_in 'Body', with: 'test_user_note'
        click_button 'Create Note'
        expect(page).to have_content 'Note was successfully created.'
        expect(page).to have_content "#{user.first_name} #{user.last_name}"
        expect(page).to have_content 'test_user_note'
        expect(current_path).to eq user_path(user)
      end

      it 'bodyなしでuser_noteの作成が失敗する' do
        click_button 'Create Note'
        expect(page).to have_content 'failed creating Note.'
        expect(current_path).to eq new_user_note_path(user)
      end
    end
  end

  describe 'userごとのuser_noteの表示' do
    context 'user_noteの表示' do
      let!(:other_user) { create(:user) }
      let!(:other_note) { create(:user_note, notable: other_user) }

      it 'userに紐づいたuser_noteが表示される' do
        visit user_path(other_user)
        expect(page).to have_content 'user_note'
      end

      it '他userに紐づいたuser_noteは表示されない' do
        visit user_path(user)
        expect(page).not_to have_content 'user_note'
      end
    end
  end

  describe 'note_indexに表示される' do
    let!(:note) { create(:user_note, notable: user) }
    before { visit notes_path }

    context 'user_noteの表示' do  
      it 'indexに表示されること' do
        expect(page).to have_content 'user_note'
      end
    end
    
    context 'user_noteからのリンク' do
      it 'user_noteからuserへのリンクが機能すること' do
        click_link 'Show this notable'
        expect(current_path).to eq user_path(user)
      end
    end
  end
end