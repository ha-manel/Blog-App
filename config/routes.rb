Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
  get 'users/:user_id/posts_list', to: 'api#list_all_user_posts', as: :list_all_user_posts
  get 'users/:user_id/posts/:post_id/comments_list', to: 'api#list_all_post_comments', as: :list_all_post_comments
  post 'users/:user_id/posts/:post_id/add_comment', to: 'api#add_comment', as: :add_comment
end
