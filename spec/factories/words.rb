FactoryBot.define do
  factory :word do
    sequence (:name) { |n| "name_#{n}"}
  end
end
