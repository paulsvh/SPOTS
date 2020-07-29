Rails.application.routes.draw do
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  match 'auth/:provider/callback', to: 'sessions#facebook', as: 'facebook', via: [:get, :post]
  match 'auth/failure', to: redirect('/'),  via: [:get, :post]
  
  resources :spots, only: [:show, :index] do
    resources :reviews
  end

  resources :users, only: [:show, :create] do
    resources :spots
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
