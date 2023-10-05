class Category < ApplicationRecord
  has_many :category_recipe, dependent: :destroy
  has_many :recipe, through: :category_recipe, dependent: :destroy

  validates :name, presence: true
end