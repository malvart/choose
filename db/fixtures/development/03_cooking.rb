cookings = [
  "チャーハン", "ハンバーグ", "シーフードサラダ", "野菜スムージー"
]

n = 1

cookings.each do |cooking|
  Cooking.seed do |s|
    s.id = n
    s.cooking_name = cooking
    s.user_id = 1
  end
  n += 1
end