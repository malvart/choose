class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cooking

  validates_uniqueness_of :cooking_id, scope: :user_id
end
