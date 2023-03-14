FactoryBot.define do
  factory :user_note, class: 'Note' do
    association :notable, factory: :user
    body { "user_note" }
  end

  factory :word_note, class: 'Note' do
    association :notable, factory: :word
    body { "word_note" }
  end

  factory :question_note, class: 'Note' do
    association :notable, factory: :question
    body {"question_note_body"}
  end
end
