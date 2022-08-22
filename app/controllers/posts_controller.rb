class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    author = current_user
    @post.author = author

    render :new unless @post.save

    redirect_to user_posts_path(author, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
