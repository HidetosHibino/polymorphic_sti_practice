FactoryBot.define do
  factory :similar, parent: :reaction, class: 'Similar' do
    type {'Similar'}
    association :similar, factory: :word
  end
end
