class UsersController < ApplicationController
  before_action :get_user, only: %i[edit show]

  def show
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
      redirect_to current_user
    else
      render :edit
    end
  end

  def new
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender, :avatar)
  end
end
