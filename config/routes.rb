Rails.application.routes.draw do
  get 'posts/index'
  root 'posts#index'
  resources :posts do
    resources :comments
  end
  resources :categories do
    resources :comments
  end
end
