require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
  end

  describe 'GET index' do
    it 'renders index' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      get :show, params: { id: @user.id }
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end
end
