Rails.application.routes.draw do
  root 'items#index'

  get "/search", to: "search#show"

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/items",        to: "items#index"
      get "/items/:id",    to: "items#show"
      delete "/items/:id", to: "items#destroy"
      post "/items",       to: "items#create"
    end
  end
end
