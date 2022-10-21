require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Should increment likes_counter' do
    author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author:, title: 'Tushar', comments_count: 1, likes_count: 2)
    before { post.likes_count = 5 }
    it 'Should increment likes_counter to be 6' do
      like = Like.new(post:)
      like.update_likes_count
      expect(post.likes_count).to eq(6)
    end
  end
end
