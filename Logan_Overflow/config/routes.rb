Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :comments
    resources :answers do
      resources :comments
    end
  end

  #register, login and logout routes
  resources :sessions, only: [:show]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
