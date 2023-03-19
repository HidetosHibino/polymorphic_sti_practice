FactoryBot.define do
  factory :rate do
    association :voter, factory: :user
  end
end
