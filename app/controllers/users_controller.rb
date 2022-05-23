class UsersController < ApplicationController
  before_action :find_user, only: %i[edit]
  before_action :username_param, only: %i[update show]

  def show
    @user = User.find_by(username: username_param)
    @post = @user.posts.order(created_at: :desc)
  end

  def edit; end

  def update_avatar
    if user_params[:avatar]
      if current_user.avatar.attach(user_params[:avatar])
        redirect_to edit_user_path(current_user.id)
      else
        render partial: 'change_avatar_modal', layout: false
      end
    else
      render :edit
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to show_user_path(user_params[:username])
    else
      render :edit
    end
  end

  def new
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  # passing '.' value to params
  def username_param
    if params[:format]
      "#{params[:username]}.#{params[:format]}"
    else
      params[:username]
    end
  end

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender, :avatar, :format)
  end
end
