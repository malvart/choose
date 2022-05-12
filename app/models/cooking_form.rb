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
    category_name.each do |cat_name|
      category = Category.where(category_name: cat_name).first_or_initialize
      category.save
      CookingCategory.create(cooking_id: cooking.id, category_id: category.id)
    end
  end

  def update(params, cooking)
    cooking.cooking_categories.destroy_all
    category_name = params.delete(:category_name)
    category_name.each do |cat_name|
      category = Category.where(category_name: cat_name).first_or_initialize if cat_name.present?
      category.save if cat_name.present?
      cooking.update(params)
      CookingCategory.create(cooking_id: cooking.id, category_id: category.id) if cat_name.present?
    end
  end
end
