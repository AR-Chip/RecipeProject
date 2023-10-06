class RemoveCountFromIngredient < ActiveRecord::Migration[7.0]
  def change
    remove_column(:ingredients, :count)
  end
end
