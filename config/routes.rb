Rails.application.routes.draw do
  # Route to Recipes
  resources :recipes, only: [:index, :show]

  # Route to Categories
  resources :categories, only: [:index, :show]

  # Route to About Us
  get 'about', to: 'static_pages#about'

  # Setting Default Page
  root to: 'recipes#index'
end
