class Category < ApplicationRecord
  has_many :cooking_categories
  has_many :cookings, through: :cooking_categories

  validates :category_name, uniqueness: true
end
