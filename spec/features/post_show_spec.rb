require 'rails_helper'

RSpec.describe 'post_show', type: :feature do
  user = User.find_by(name: 'Jane')
  post = user.posts.first

  before(:each) do
    visit user_post_path(user.id, post.id)
  end

  it 'can see the post\'s title' do
    expect(page).to have_content(post.title)
  end

  it 'can see the post\'s author name' do
    expect(page).to have_content(user.name)
  end

  it 'can see the post\'s number of comments' do
    expect(page).to have_content("Comments: #{post.comments_count}")
  end

  it 'can see the post\'s number of likes' do
    expect(page).to have_content("Likes: #{post.likes_count}")
  end

  it 'can see the post\'s body' do
    expect(page).to have_content(post.text)
  end

  it 'can see the name of the commentor' do
    commentor_id = post.comments.first.author_id
    commentor = User.find(commentor_id).name
    expect(page).to have_content(commentor)
  end

  it 'can see the comment\'s text' do
    expect(page).to have_content(post.comments.first.text)
  end
end
