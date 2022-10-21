require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  it 'requires a title attribute' do
    expect(Post.new).to_not be_valid
  end
  it 'requires likes and comment counter to be an integer' do
    post = Post.new(title: 'Tushar', comments_count: 1.25, likes_count: 'one')
    expect(post).to_not be_valid
  end
  it 'should be valid with correct parameters' do
    post = Post.new(author:, title: 'Tushar', comments_count: 1, likes_count: 2)
    expect(post).to be_valid
  end

  describe 'Should increment posts_counter' do
    before { author.posts_count = 5 }
    it 'Should increment posts_counter to be 6' do
      post = Post.new(author:, title: 'Tushar', comments_count: 1, likes_count: 2)
      post.update_posts_count
      expect(author.posts_count).to eq(6)
    end
  end

  describe 'Should return 5 recent comments' do
    post = Post.create(author_id: author.id, title: 'Tushar', comments_count: 1, likes_count: 2)
    before { 6.times { |n| Comment.create(post_id: post.id, author_id: author.id, text: "Hi Tom! #{n}") } }
    it 'post should have 5 recent comments' do
      expect(post.recent_comments).to eq(post.comments.last(5))
    end
  end
end
