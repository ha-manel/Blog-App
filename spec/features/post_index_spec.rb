require 'rails_helper'

RSpec.describe 'post_index', type: :feature do
  user = User.find_by(name: 'Jane')
  post = user.posts.first

  before(:each) do
    visit user_posts_path(User.find_by(name: 'Jane').id)
  end

  it 'shows the user\'s profile picture' do
    expect(page.html).to include('user-photo')
  end

  it 'can see the user\'s username' do
    expect(page).to have_content(user.name)
  end

  it 'can see the user\'s number of posts' do
    expect(page).to have_content("Number of posts: #{user.posts_count}")
  end

  it 'can see the post\'s title' do
    expect(page).to have_content(post.title)
  end

  it 'can see the post\'s body' do
    expect(page).to have_content(post.text)
  end

  it 'can see the post\'s comments' do
    expect(page.html).to include('comment')
  end

  it 'can see the post\'s number of comments' do
    expect(page).to have_content("Comments: #{post.comments_count}")
  end

  it 'can see the post\'s number of likes' do
    expect(page).to have_content("Likes: #{post.likes_count}")
  end

  it 'can see a section for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects to the post\'s page when a post is clicked' do
    click_link(post.title)
    expect(page.current_path).to eql(user_post_path(user_id: user.id, id: post.id))
  end
end
