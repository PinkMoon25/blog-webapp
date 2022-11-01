require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index' do
    before(:each) do
      @user_one = User.create(name: 'Sam', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Poland.', posts_count: 1)
      @user_two = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from India.', posts_count: 1)
    end

    it 'should show list of all users' do
      visit '/users'
      expect(page).to have_content(@user_one.name)
      expect(page).to have_content(@user_two.name)
    end
    it 'should show Photo of all users' do
      visit '/users'
      expect(page.html).to include(@user_one.photo)
      expect(page.html).to include(@user_two.photo)
    end
    it 'should show number of posts of all users' do
      visit '/users'
      expect(page.html).to have_content(@user_one.posts_count)
      expect(page.html).to have_content(@user_two.posts_count)
    end
    it 'when clicked on a user, redirect to that users show page.' do
      visit '/users'
      click_on @user_one.name.to_s
      expect(current_path).to eq("/users/#{@user_one.id}")
    end
  end
end
