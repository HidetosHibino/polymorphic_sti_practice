FactoryBot.define do
  factory :user_note, class: 'Note' do
    association :notable, factory: :user
    body { "user_note" }
    association :author, factory: :user
  end

  factory :word_note, class: 'Note' do
    association :notable, factory: :word
    body { "word_note" }
    association :author, factory: :user
  end

  factory :question_note, class: 'Note' do
    association :notable, factory: :question
    body {"question_note_body"}
    association :author, factory: :user
  end
end
