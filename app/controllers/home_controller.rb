class HomeController < ApplicationController
  include Pagy::Backend

  before_action :set_suggest_user, only: %i[index]

  before_action :check_login

  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc), items: 5)
  end

  private

  def set_suggest_user
    @suggest_users = User.take(5)
  end

  def check_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
