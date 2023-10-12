class Category < ApplicationRecord
  has_many :category_recipe, dependent: :destroy
  has_many :recipes, through: :category_recipe, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end