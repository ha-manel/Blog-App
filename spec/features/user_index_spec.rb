require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  before(:each) do
    visit root_path
  end

  it 'shows the username of the users' do
    expect(page).to have_content('Tom')
  end

  it 'shows the photos of the users' do
    expect(page.html).to include('user-photo')
  end

  it 'shows the number of post of each user' do
    user = User.last
    expect(page).to have_content("Number of posts: #{user.posts_count}")
  end

  it 'should redirect to user show page when a name is clicked' do
    user = User.first
    click_link(user.name)
    expect(page.current_path).to eql(user_path(id: user.id))
  end
end
