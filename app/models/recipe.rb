class Recipe < ApplicationRecord
  has_many :category_recipe, dependent: :destroy
  has_many :category, through: :category_recipe, dependent: :destroy
  has_many :ingredient_recipe, dependent: :destroy
  has_many :ingredient, through: :ingredient_recipe, dependent: :destroy

  validates :name, :instructions, :calories, :image, presence: true
  validates :calories, numericality: {only_integers: true}
end
