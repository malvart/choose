class CookingForm
  include ActiveModel::Model

  attr_accessor(
    :cooking_name, :user_id, :image,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :category_name
  )

  validates :cooking_name, presence: true

  def save
    cooking = Cooking.create(cooking_name: cooking_name, user_id: user_id, image: image)
    category = Category.where(category_name: category_name).first_or_initialize
    category.save
    CookingCategory.create(cooking_id: cooking.id, category_id: category.id)
  end
end
