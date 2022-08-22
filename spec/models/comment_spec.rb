require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Jane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author: user, title: 'Hello', text: 'This is my first post')
  Comment.create(post:, author: user, text: 'this is where the comment text goes')

  it 'comments counter should be 1' do
    expect(post.comments_count).to eq 1
  end
end
