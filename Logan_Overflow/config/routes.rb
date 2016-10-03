Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :answers
  end
  resources :comments, only: [:new, :edit, :create, :update, :destroy]

  #register, login and logout routes
  resources :sessions, only: [:show]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'
  post '/users' => 'users#create'
end
