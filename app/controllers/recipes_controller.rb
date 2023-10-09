class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:category, :ingredient).order(:name)
  end

  def show
    @recipe = Recipe.includes(:category, :ingredient, :ingredient_recipe).find(params[:id])
  end
end
