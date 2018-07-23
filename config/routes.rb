Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :user_accounts
  get "/items/most_recent" => "items#most_recent"
  get "/items/oldest" => "items#oldest"
  get "/services/most_recent" => "services#most_recent"
  get "/services/oldest" => "services#oldest"
  resources :merchants do
    resources :items, only: [:index, :new, :edit, :show]
    resources :services, only: [:index, :new, :edit, :show]
  end
  resources :clients do
    resources :items, only: [:index, :new, :edit, :show]
    resources :services, only: [:index, :new, :edit, :show]
  end
  resources :items
  resources :services
  post "/items/:id" => "items#buy"
  post "/services/:id" => "services#buy"
  get "/auth/github/callback" => "sessions#create_user_with_github"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
