require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'john', photo: 'link to photo', bio: 'dev', posts_count: 0)

  subject do
    Post.new(author: user, title: 'web dev best practices', text: 'this is where the post text goes',
             comments_count: 0, likes_count: 0)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments count should be integer' do
    subject.comments_count = 'hello'
    expect(subject).to_not be_valid
  end

  it 'comments count should be >= 0' do
    subject.comments_count = -1
    expect(subject).to_not be_valid
  end

  it 'likes count should be integer' do
    subject.likes_count = 'hello'
    expect(subject).to_not be_valid
  end

  it 'likes count should be >= 0' do
    subject.likes_count = -1
    expect(subject).to_not be_valid
  end

  it 'returns recent comments' do
    Comment.create(post: subject, author: user, text: 'test')
    comments = subject.recent_comments
    expect(comments.length).to eq 1
  end
end
