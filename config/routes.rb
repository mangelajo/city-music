Rails.application.routes.draw do
  Healthcheck.routes(self)
  resources :bands
  resources :events
  resources :artists
  resources :venues
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
