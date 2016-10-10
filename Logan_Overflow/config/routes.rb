Rails.application.routes.draw do
  get 'static/index'

  get '/' => 'static#index'
  root to: 'static#index'

  #register, login and logout routes
  resources :sessions, only: [:show]
  get '/posts/display/:id' => 'posts#display'
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
