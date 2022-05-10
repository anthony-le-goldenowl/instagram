class PostsController < ApplicationController
  def create
    if Post.create(post_params)
      redirect_to root_path
    else
      render partial: 'create_post_modal'
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :images, :user_id)
  end
end