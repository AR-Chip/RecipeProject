class CreateCategoryRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :category_recipes do |t|
      t.references :category, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
