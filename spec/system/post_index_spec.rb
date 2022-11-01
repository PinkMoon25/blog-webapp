require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Sam', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Poland.', posts_count: 1)
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post',
                          comments_count: 0, likes_count: 0)
      @comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      visit "/users/#{@user.id}/posts"
    end
    it 'should show user name' do
      expect(page).to have_content(@user.name)
    end
    it 'should show user posts count' do
      expect(page).to have_content(@post.title)
    end
    it 'should show user photo' do
      expect(page.html).to include(@user.photo)
    end
    it 'should show user post count' do
      expect(page.html).to have_content(@user.posts_count)
    end
    it 'should show user posts body' do
      expect(page).to have_content(@post.text)
    end
    it 'should show first comments in a post' do
      expect(page).to have_content(@comment.text)
    end
    it 'should show number of comments on a post' do
      expect(page).to have_content(@post.comments_count)
    end
    it 'should show number of likes on a post' do
      expect(page).to have_content(@post.likes_count)
    end
    it 'when clicked on a post, redirects to posts show page' do
      click_link @post.title.to_s
      expect(current_path).to eq("/users/#{@user.id}/posts/#{@post.id}")
    end
  end
end
