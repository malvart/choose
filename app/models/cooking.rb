class Cooking < ApplicationRecord
  has_many :cooking_categories, dependent: :destroy
  has_many :categories, through: :cooking_categories
  has_one_attached :image
end
