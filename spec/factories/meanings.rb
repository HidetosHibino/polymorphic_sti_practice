FactoryBot.define do
  factory :meaning, parent: :reaction, class: 'Meaning' do
    type {"Meaning"}
    sequence(:body) { |n| "meaning_#{n}" }
  end
end
