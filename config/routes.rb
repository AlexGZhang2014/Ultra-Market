Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :user_accounts
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
  post "/complete/:id" => "services#complete"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
