FactoryBot.define do
  factory :sound, parent: :reaction, class: 'Sound' do
    type { 'Sound' }
  end
end
