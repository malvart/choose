class Cooking < ApplicationRecord
  belongs_to :user
  has_many :cooking_categories, dependent: :destroy
  has_many :categories, through: :cooking_categories
  has_one :recipe
  has_one_attached :image
end
