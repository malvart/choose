class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    cooking_categories = CookingCategory.where(category_id: @category.id).pluck(:cooking_id)
    @cookings = Cooking.where(id: cooking_categories)
  end
end
