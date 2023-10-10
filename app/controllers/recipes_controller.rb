class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:category, :ingredient).order(:name).page(params[:page]).per(10)
  end

  def show
    @recipe = Recipe.includes(:category, :ingredient, :ingredient_recipe).find(params[:id])
  end
end
