class Post < ApplicationRecord
  blongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :likes
  has_many :comments
end
