Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: %i[show edit update]
end
