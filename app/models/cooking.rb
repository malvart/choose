class Cooking < ApplicationRecord
  belongs_to :user
  has_many :cooking_categories, dependent: :destroy
  has_many :categories, through: :cooking_categories
  has_many :favorites, dependent: :destroy
  has_one :recipe, dependent: :destroy
  has_one_attached :image
end
