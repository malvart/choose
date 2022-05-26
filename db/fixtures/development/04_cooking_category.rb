3.times do |n|
  CookingCategory.seed do |s|
    s.id = n + 1
    s.cooking_id = n + 1
    s.category_id = n + 1
  end
end