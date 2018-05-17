Rails.application.routes.draw do

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

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


end
