class Posts::ReactionsController < ApplicationController
  before_action :set_post

  def create
    if current_user.like_post(@post.id)
      @post.reload
      respond_to do |format|
        format.html { redirect_to root }
        format.js
      end
    end
  end

  def destroy
    if current_user.unlike_post(@post.id)
      @post.reload
      respond_to do |format|
        format.html { redirect_to root }
        format.js { render action: :create }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
