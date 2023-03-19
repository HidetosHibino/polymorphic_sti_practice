FactoryBot.define do
  factory :good_rate, parent: :rate, class: 'GoodRate' do
    type { "GoodRate" }
  end

  factory :user_good_rate, parent: :rate, class: 'GoodRate' do
    association :ratable, factroy: :user
    type { "GoodRate" }
  end

  factory :word_good_rate, parent: :rate, class: 'GoodRate' do
    association :ratable, factroy: :word
    type { "GoodRate" }
  end

end
