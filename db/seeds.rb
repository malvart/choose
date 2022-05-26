cats = [
  "主食", "主菜", "副菜",
  "ごはんもの", "めん類", "パン類",
   "和食", "洋食", "中華",
  "サラダ・和え物","つけもの・おひたし", "みそ汁・スープ"
]

cats.each do |cat|
  Category.create!(category_name: "#{cat}")
end

User.create!(
  nickname: "テスト"
  email: "test@test"
  password: "123qwe"
)

cookings = [
  "チャーハン", "ハンバーグ", "シーフードサラダ", "野菜スムージー"
]

cookings.each do |cooking|
  Cooking.create!(
    cooking_name: "#{cooking}"
    user_id: 1
  )
end

3.times do |n|
  CookingCategory.create!(
    cooking_id: n + 1
    category_id: n + 1
  )
end