Rails.application.routes.draw do
  get 'home/index'
  get 'search' => 'search#index'
  patch '/users/:id/avatar/edit' => 'users#update_avatar', as: :edit_avatar
  get "/:username/" => 'users#show', as: :show_user
  root to: 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: %i[edit update new] do
    post :follow, to: 'users/follows#create', as: :follow
    delete :follow, to: 'users/follows#destroy', as: :unfollow
  end
  resources :posts, only: %i[new create show destroy]
end
