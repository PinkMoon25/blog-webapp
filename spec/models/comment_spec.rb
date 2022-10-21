require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Should increment comments_counter' do
    author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author:, title: 'Tushar', comments_count: 1, likes_count: 2)
    before { post.comments_count = 5 }
    it 'Should increment comments_counter to be 6' do
      comment = Comment.new(post:)
      comment.update_comments_count
      expect(post.comments_count).to eq(6)
    end
  end
end
