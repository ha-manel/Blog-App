require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'john', photo: 'link to photo', bio:'dev', posts_count: 0) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts count should be integer' do
    subject.posts_count = 'hello'
    expect(subject).to_not be_valid
  end

  it 'posts count should be >= 0' do
    subject.posts_count = -1
    expect(subject).to_not be_valid
  end

  it 'returns recent posts' do
    post = Post.create(author: subject, title: 'test', text: 'test', comments_count: 0, likes_count: 0)
    posts = subject.recent_posts
    expect(posts.length).to eq 1
  end
end
