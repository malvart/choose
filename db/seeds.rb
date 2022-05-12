cats = [
  "主食", "主菜", "副菜",
  "ごはんもの", "めん類", "パン類",
   "和食", "洋食", "中華",
  "サラダ・和え物","つけもの・おひたし", "みそ汁・スープ"
]

cats.each do |cat|
  Category.create!(category_name: "#{cat}")
end
