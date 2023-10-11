class AddCountToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredient_recipes, :count, :integer
  end
end
