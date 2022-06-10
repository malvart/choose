FactoryBot.define do
  factory :cooking do
    sequence(:cooking_name) { |n| "cooking_name-#{n}" }

    after(:create) do |cooking|
      create_list(:cooking_category, 1, cooking: cooking, category: create(category))
    end
  end
end
