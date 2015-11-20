Rails.application.routes.draw do

  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :bands
  resources :albums, except: :index
  resources :tracks, except: :index do
    resources :notes, only: [:create, :destroy]
  end

  root to: "bands#index"
end
