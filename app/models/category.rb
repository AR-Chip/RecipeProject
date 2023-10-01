class Category < ApplicationRecord
  has_many :category_recipe
  has_many :recipe, through: :category_recipe

  validates :name, presence: true
end