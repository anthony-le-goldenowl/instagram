Rails.application.routes.draw do
  get 'home/index'
  get 'search' => 'search#index'
  patch '/users/:id/avatar/edit' => 'users#update_avatar', as: :edit_avatar
  root to: 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: %i[show edit update new]
  resources :posts, only: %i[new create show destroy]
end
