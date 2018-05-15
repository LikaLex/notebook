Rails.application.routes.draw do
  get 'welkome/index'

  root "welkome#index"

  resources :notes
end
