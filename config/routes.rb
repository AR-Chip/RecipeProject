Rails.application.routes.draw do
  get 'search/results'
  # Route to Recipes
  resources :recipes, only: [:index, :show]

  # Route to Categories
  resources :categories, only: [:index, :show]

  # Manual Routes
  # Route to About Us
  get 'about', to: 'static_pages#about'

  # Search Results Action
  get 'search_results', to: 'search#results'

  # Setting Default Page
  root to: 'recipes#index'

  # Redirect to Root if page doesn't exist
  get '*path', to: 'application#go_to_root'
end
