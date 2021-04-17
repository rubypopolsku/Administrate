Rails.application.routes.draw do
  resources :ideas
  namespace :admin do
      resources :users
      resources :categories
      resources :comments do
        get :destroy_all, on: :collection
      end
      resources :posts
      resources :ideas

      root to: "users#index"
    end
  devise_for :users
  resources :categories
  root to: "posts#index"
  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
