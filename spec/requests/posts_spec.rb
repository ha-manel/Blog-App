require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET index' do
    before :each do
      get '/users/index/posts'
    end

    it 'renders index' do
      expect(response).to render_template('posts/index')
    end

    it 'returns code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body has the right placeholder' do
      expect(response.body).to include('Here is the list of posts:')
    end
  end

  describe 'GET show' do
    before :each do
      get '/users/index/posts/index'
    end

    it 'renders show' do
      expect(response).to render_template('posts/show')
    end

    it 'returns code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body has the right placeholder' do
      expect(response.body).to include('Here is the list of posts for a given user:')
    end
  end
end