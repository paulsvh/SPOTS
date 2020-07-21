Rails.application.routes.draw do
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'


  resources :reviews

  resources :creators, only: [:new] do
    resources :spots
  end

  resources :spots, only: [:show, :index] do
    resources :reviews, only: [:new, :index]
  end

  resources :users, only: [:show, :create]

  resources :cities, only: [:show, :index] do
    resources :spots, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
