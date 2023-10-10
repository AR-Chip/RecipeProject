class SearchController < ApplicationController
  def results
    # Getting Access to User Submitted Query
    @query = params[:q]
    @recipes = Recipe.where('name LIKE ?', "%#{@query}%")
  end
end
