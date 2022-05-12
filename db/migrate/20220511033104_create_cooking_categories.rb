class CreateCookingCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :cooking_categories do |t|
      t.references :cooking, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
