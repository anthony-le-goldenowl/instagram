Rails.application.routes.draw do
  get 'home/index'
  get 'search' => 'search#index'
  patch '/users/:id/avatar/edit' => 'users#update_avatar', as: :edit_avatar
  get '/:username/' => 'users#show', username: /[^\/]+/, as: :show_user
  root to: 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: %i[edit update new], param: :username, username: /[^\/]+/ do
    post :follow, to: 'users/follows#create', as: :follow
    delete :follow, to: 'users/follows#destroy', as: :unfollow
  end

  #post resources
  resources :posts, only: %i[new create show destroy edit update] do
    post :like, to: 'posts/reactions#create', as: :like
    delete :like, to: 'posts/reactions#destroy', as: :unlike
  end
end
