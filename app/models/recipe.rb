class Recipe < ApplicationRecord
  has_many :category_recipe
  has_many :category, through: :category_recipe
  has_many :ingredient_recipe
  has_many :ingredient, through: :ingredient_recipe

  validates :name, :instructions, :calories, :image, presence: true
  validates :calories, numericality: {only_integers: true}
end
