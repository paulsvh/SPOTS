Rails.application.routes.draw do
  get 'sessions/welcome'
  get 'sessions/new'
  get 'sessions/create'
  resources :cities
  resources :reviews
  resources :spots
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
