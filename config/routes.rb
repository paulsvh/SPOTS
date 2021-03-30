Rails.application.routes.draw do
  root 'sessions#index'
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  get '/auth/facebook/callback' => 'sessions#facebook'

  
  resources :spots, only: [:show, :index] do
    resources :reviews, except: [:index]
  end

  resources :users, only: [:show, :create] do
    resources :spots
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
