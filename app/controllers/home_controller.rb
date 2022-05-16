class HomeController < ApplicationController
  before_action :check_login

  def index
    @posts = Post.order(created_at: :desc)
  end

  private

  def check_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
