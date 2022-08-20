class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    author = current_user
    liked = Like.where(author:, post:)

    return if liked.present?

    like = Like.create(author:, post:)
    return unless like.save

    redirect_to user_post_path(post.author, post)
  end
end
