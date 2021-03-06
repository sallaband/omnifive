Rails.application.routes.draw do
  root to: "static_pages#root"
  
  resources :users, only: [:create, :destroy, :new]
  resource :session, only: [:create, :destroy, :new]
  
  namespace :api, defaults: { format: :json } do
    resources :gigs, only: [:create, :destroy, :show, :index] do
      resources :reviews, only: [:index]
    end
    resources :gigextras, only: [:create, :update, :destroy]
    resources :users, only: [:show, :update] do
      resources :reviews, only: [:index]
    end
    resources :orders, only: [:create, :show]
    resources :likes, only: [:create]
    delete 'likes', to: 'likes#destroy'
  end
  
end
