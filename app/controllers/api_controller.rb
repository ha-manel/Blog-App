class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!

  def list_all_user_posts
    authentication_token = params[:authentication_token]
    return unless check_user_token(authentication_token)

    posts = Post.where(author_id: params[:user_id])
    render json: posts, status: ok
  end

  def list_all_post_comments
    authentication_token = params[:authentication_token]
    return unless check_user_token(authentication_token) && check_post_params

    comments = Comment.where(post_id: params[:post_id], author_id: params[:user_id])

    render json: comments, status: ok
  end

  def add_comment
    authentication_token = params[:authentication_token]
    return unless check_user_token(authentication_token)

    post_id = params[:post_id]
    text = params[:text]
    return unless check_comment_params(text)

    comment = Comment.new(text:, author: @current_user, post_id:)
    if comment.save
      render json: comment, status: ok
    else
      render json: { error: 'Comment was not created.' }, status: 500
    end
  end

  private

  def check_comment_params(text)
    if !check_post_params || text.nil? || text.empty?
      render json: { error: 'Comment can\'t be created.' }, status: 400
      false
    else
      true
    end
  end

  def check_post_params
    if Post.where(id: params[:post_id], author_id: params[:user_id]).exists?
      true
    else
      render json: { error: 'Post does not exist.' }, status: 404
      false
    end
  end

  def check_user_token(authentication_token)
    if authentication_token.nil?
      render json: { error: 'Invalid token.' }, status: 400
      false
    elsif !authenticate(authentication_token)
      render json: { error: 'Not authorized.' }, status: 401
      false
    elsif !User.exists?(params[:user_id])
      render json: { error: 'User does not exist' }, status: 404
      false
    else
      true
    end
  end

  def authenticate(authentication_token)
    email = ApiHelper::JsonWebToken.decode(authentication_token)[0]
    user = User.find_by(email:)
    return false if user.nil?

    @current_user = user
    true
  end
end
