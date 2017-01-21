Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root "projects#index"
  post "/projects/pay" => "payment#pay"
  resources :users do
    member do
      get :following, :follower
    end
  end
  resources :projects do
    collection do
      get "search"
      get "apply"
      get "pay1"
      get "pay2"
    end

    member do
      get "pay3"
      post "add" => "favorites#create"
    end
  end

  resources :favorites, only: [:destroy]
  resources :relationships

end
