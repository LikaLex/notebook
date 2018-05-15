Rails.application.routes.draw do
  devise_for :users
  get 'welkome/index'

  root "welkome#index"

  resources :notes
end
