Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :comments
    resources :answers do
      resources :comments
    end
  end
end
