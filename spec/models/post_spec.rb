require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'lilly', photo: 'link to photo', bio: 'dev')

  subject do
    Post.new(author: user, title: 'web dev best practices', text: 'this is where the post text goes')
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'returns recent comments' do
    Comment.create(post: subject, author: user, text: 'test')
    comments = subject.recent_comments
    expect(comments.length).to eq 1
  end
end
