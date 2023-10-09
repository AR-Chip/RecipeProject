class IngredientRecipe < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :count, presence: true, numericality: {only_integers: true}
end
