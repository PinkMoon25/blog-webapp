require 'rails_helper'

RSpec.describe User, type: :model do
  it 'requires a name attribute' do
    expect(User.new).to_not be_valid
  end
  it 'requires posts counter to be an integer' do
    user = User.new(name: 'Tushar', posts_count: 1.25)
    expect(user).to_not be_valid
  end
  it 'should be valid with correct parameters' do
    user = User.new(name: 'Tushar', posts_count: 1)
    expect(user).to be_valid
  end

  describe 'Should return 3 recent post' do
    user = User.create(name: 'Tushar')
    before { 4.times { |n| Post.create(author_id: user.id, title: "Post #{n}", text: 'Post Decrtiption') } }
    it 'User should have 3 recent posts' do
      expect(user.recent_posts).to eq(user.posts.last(3))
    end
  end
end
