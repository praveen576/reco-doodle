Rails.application.routes.draw do
  resources :tags
  resources :activities
  resources :attractions
  devise_for :users
  resources :roleusers
  resources :roles
  resources :destinations do
    collection do
      get :filter_destinations
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "destinations#index"
end
