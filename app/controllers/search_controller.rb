class SearchController < ApplicationController
  def index
    if params[:query].start_with?('#')
      @hash_tag_name_finding = params[:query]
      query  = params[:query].gsub('#', '')
      @posts = Post.joins(:hash_tags).where(hash_tags: { name: query })
    else
      @user_found = User.find_by(username: params[:query])
      redirect_to show_user_path(@user_found.username) unless @user_found.nil?
    end
  end
end
