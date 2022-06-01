FactoryBot.define do
  factory :user do
    nickname              {'テスト'}
    email                 {'test@example'}
    password              {'123456'}
    password_confirmation {password}
  end
end