class Recipe < ApplicationRecord
  with_options presence: true do
    validates :ingredient
    validates :process
    validates :duration
    validates :plate
  end
  belongs_to :cooking, dependent: :destroy
end
