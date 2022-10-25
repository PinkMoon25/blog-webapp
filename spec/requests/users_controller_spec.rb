require 'rails_helper'

RSpec.describe UsersController, type: :request do
  it 'create users and redirects to users page' do
    get '/users'
    expect(response).to render_template(:index)
    expect(response.body).to include('List of all users')
    expect(response.status).to be(200)
  end
  it 'create user based on user id and redirects to user show page' do
    get '/users/:id'
    expect(response).to render_template(:show)
    expect(response.body).to include('A specific user based on user id')
    expect(response.status).to be(200)
  end
end
