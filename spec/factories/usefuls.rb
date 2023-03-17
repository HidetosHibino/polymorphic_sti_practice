FactoryBot.define do
  factory :useful do
    association :sample, factory: :sample
    association :user, factory: :user
  end
end
