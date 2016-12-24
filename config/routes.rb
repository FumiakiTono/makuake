Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :users, only: [:show]
  resources :projects do
    collection do
      get "search"
      get "apply"
      get "pay1"
      get "pay2"
      get "pay3"
    end
  end
end
