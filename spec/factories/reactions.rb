FactoryBot.define do
  factory :reaction do
    association :word, factory: :word
    type { "" }
    sequence(:body) { |n| "reaction_#{n}" }
  end
end
