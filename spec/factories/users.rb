FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "first_#{n}" }
    sequence(:last_name) { |n| "last_#{n}" }
  end
end
