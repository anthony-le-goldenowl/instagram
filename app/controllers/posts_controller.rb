class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit; end

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

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end
end
