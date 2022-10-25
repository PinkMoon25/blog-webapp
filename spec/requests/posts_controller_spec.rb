require 'rails_helper'

RSpec.describe PostsController, type: :request do
  it 'create list of posts for a specific user based on user-id' do
    get '/users/:user_id/posts'
    expect(response).to render_template(:index)
    expect(response.body).to include('Lists of Posts for a specific User')
    expect(response.status).to be(200)
  end
  it 'crate specific post of a user based on post id ans redirects to show posts page' do
    get '/users/:user_id/posts/:id'
    expect(response).to render_template(:show)
    expect(response.body).to include('Specific post of a user based on post id')
    expect(response.status).to be(200)
  end
end
