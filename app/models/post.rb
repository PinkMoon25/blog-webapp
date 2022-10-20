class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :likes
  has_many :comments

  def update_posts_count
    author.increment!(:posts_count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
