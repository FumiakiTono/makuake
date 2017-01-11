Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root "projects#index"
  post "/projects/pay" => "payment#pay"
  resources :users, only: [:show]
  resources :projects do
    collection do
      get "search"
      get "apply"
      get "pay1"
      get "pay2"
      # get "pay3"
    end

    member do
      get "pay3"
      post "add" => "favorites#create"
    end
  end

  resources :favorites, only: [:destroy]

end
