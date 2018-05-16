Rails.application.routes.draw do
  devise_for :users
  get 'welkome/index'

  resources :notes do
    collection do
      get 'search'
    end
  end

  authenticated :user do
    root 'notes#index', as: "authenticated_root"
  end

  root "welkome#index"


end
