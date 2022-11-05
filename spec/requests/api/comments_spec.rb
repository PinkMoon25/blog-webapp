require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  path '/api/users/{user_id}/posts/{id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    post('create comment') do
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
