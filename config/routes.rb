Rails.application.routes.draw do
  root 'items#index'

  get "/search", to: "search#show"

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
