FactoryBot.define do
  factory :question do
    sequence(:title) { |n| "question_#{n}" }
    body { "question_note" }
  end
end
