class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  before_validation :set_counter
  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def set_counter
    self.posts_count = 0 if posts_count.nil?
  end
  
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
