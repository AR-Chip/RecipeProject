Rails.application.routes.draw do
  resources :recipes, only: [:index, :show]

  # Setting Default Page
  root to: 'recipes#index'
end
