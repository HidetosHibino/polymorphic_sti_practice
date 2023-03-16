FactoryBot.define do
  factory :sample, parent: :reaction, class: 'Sample' do
    type {"Sample"}
    sequence(:body) { |n| "sample_#{n}" }
  end
end
