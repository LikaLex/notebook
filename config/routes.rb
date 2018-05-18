Rails.application.routes.draw do

  get 'welkome/index'

  resources :notes do
    get 'export', on: :collection
  end

  authenticated :user do
    root 'notes#index', as: "authenticated_root"
  end

  root "welkome#index"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
