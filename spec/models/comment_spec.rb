require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_count: 0)
  post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_count: 0, likes_count: 0)

  subject{ Comment.new(post: post, author: user, text: 'this is where the comment text goes') }

  before { subject.save }

  it 'comments counter should be 1' do
    expect(post.comments_count).to eq 1
  end
end
