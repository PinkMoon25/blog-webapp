require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Sam', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Poland.', posts_count: 1)
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post',
                          comments_count: 0, likes_count: 0)
      @comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      visit "/users/#{@user.id}/posts/#{@post.id}"
    end
    it 'should show post title' do
      expect(page).to have_content(@post.title)
    end
    it 'should show author of posts' do
      expect(page).to have_content(@post.author.name)
    end
    it 'should show post comments' do
      expect(page).to have_content(@post.comments_count)
    end
    it 'should show post likes' do
      expect(page).to have_content(@post.likes_count)
    end
    it 'should show posts body' do
      expect(page).to have_content(@post.text)
    end
    it 'should show name of commenter in a post' do
      expect(page).to have_content(@comment.author.name)
    end
    it 'should show comments text' do
      expect(page).to have_content(@comment.text)
    end
  end
end
