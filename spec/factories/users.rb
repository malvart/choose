FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.email}
    password              {'123456'}
    password_confirmation {password}
  end
end