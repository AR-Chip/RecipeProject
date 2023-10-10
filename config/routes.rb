Rails.application.routes.draw do
  resources :recipes, only: [:index, :show]
  resources :categories, only: [:index, :show]

  # Setting Default Page
  root to: 'recipes#index'
end
