FactoryBot.define do
  factory :cooking do
    cooking_name {'ハンバーグ'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/no_image_yoko.jpg'), filename: 'no_image_yoko.jpg')
    end
  end
end
