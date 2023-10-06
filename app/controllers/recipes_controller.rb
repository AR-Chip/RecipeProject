class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order(:name)
  end

  def show
  end
end
