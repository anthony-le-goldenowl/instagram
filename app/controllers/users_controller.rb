class UsersController < ApplicationController
  before_action :find_user, only: %i[edit]

  def show
    @user = User.find_by(username: params[:username])
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

  def new; end

  private

  def find_user
    @user = User.find_by(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:user_username, :username, :name, :website, :bio, :email, :phone, :gender, :avatar)
  end
end
