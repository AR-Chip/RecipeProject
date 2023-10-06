class Ingredient < ApplicationRecord
  has_many :ingredient_recipe, dependent: :destroy
  has_many :recipe, through: :ingredient_recipe, dependent: :destroy

  validates :name, :count, presence: true
  validates :name, uniqueness: true
  validates :count, numericality: {only_integers: true}
end