FactoryBot.define do
  factory :bad_rate, parent: :rate, class: 'BadRate' do
    type { "BadRate" }
  end

  factory :user_bad_rate, parent: :rate, class: 'BadRate' do
    association :ratable, factroy: :user
    type { "BadRate" }
  end

  factory :word_bad_rate, parent: :rate, class: 'BadRate' do
    association :ratable, factroy: :word
    type { "BadRate" }
  end
end
