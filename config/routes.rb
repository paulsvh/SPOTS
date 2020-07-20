Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :cities
  resources :reviews
  resources :spots
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
