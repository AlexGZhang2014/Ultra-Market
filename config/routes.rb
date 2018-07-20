Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :user_accounts
  resources :merchants do
    resources :items, only: [:index, :new, :create, :show]
    resources :services, only: [:index, :new, :create, :show]
  end
  resources :clients do
    resources :items, only: [:index, :new, :create, :show]
    resources :services, only: [:index, :new, :create, :show]
  end
  resources :items
  resources :services
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
