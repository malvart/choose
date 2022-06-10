FactoryBot.define do
  factory :cooking_category do
    association :cooking
    association :category
  end
end
