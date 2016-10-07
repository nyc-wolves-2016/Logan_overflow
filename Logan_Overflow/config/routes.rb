Rails.application.routes.draw do
  root to: 'posts#index'

  #register, login and logout routes
  resources :sessions, only: [:show]
  get '/posts/recent' => 'posts#recent'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'
  post '/users' => 'users#create'

  resources :posts do
    resources :answers, except: [:index, :show]
  end
  resources :comments, except: [:index, :show]
end
