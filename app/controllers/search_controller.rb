class SearchController < ApplicationController
  def results
    # Getting Access to User Submitted Query
    @query = params[:q]

    # Filter by category if :category parameter is present
    if params[:category].present?
      @category = Category.find(params[:category])
      @recipes = @category.recipes.where('name LIKE ?', "%#{@query}%").page(params[:page]).per(10)
    else
      @recipes = Recipe.where('name LIKE ?', "%#{@query}%").page(params[:page]).per(10)
    end
  end
end
