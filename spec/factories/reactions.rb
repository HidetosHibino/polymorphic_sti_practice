FactoryBot.define do
  factory :reaction do
    association :word, factory: :word
    type { "" }
  end
end
