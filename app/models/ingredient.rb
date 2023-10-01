class Ingredient < ApplicationRecord
  has_many :ingredient_recipe
  has_many :recipe, through: :ingredient_recipe

  validates :name, presence: true
end