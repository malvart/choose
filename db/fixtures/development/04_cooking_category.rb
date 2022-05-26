3.times do |n|
  CookingCategory.seed do |s|
    s.cooking_id = n + 1
    s.category_id = n + 1
  end
end