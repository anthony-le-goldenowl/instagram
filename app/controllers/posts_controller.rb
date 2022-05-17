class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.image.attach(post_params[:image])

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end
end
