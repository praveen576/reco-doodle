Rails.application.routes.draw do
  devise_for :users
  resources :roleusers
  resources :roles
  resources :destinations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "destinations#index"
end
