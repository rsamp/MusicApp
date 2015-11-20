Rails.application.routes.draw do

  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :bands
  resources :albums, :tracks, except: [:index]

  root to: "bands#index"
end
