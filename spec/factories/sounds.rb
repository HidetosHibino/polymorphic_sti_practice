FactoryBot.define do
  factory :sound, parent: :reaction, class: 'Sound' do
    type { 'Sound' }
    sequence(:body) { |n| "sonud_#{n}" }
  end
end
