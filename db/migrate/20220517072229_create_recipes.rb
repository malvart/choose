class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.text       :ingredient, null: false
      t.text       :process,    null: false
      t.integer    :duration,   null: false
      t.integer    :plate,      null: false
      t.references :cooking,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
