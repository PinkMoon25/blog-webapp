class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  before_validation :set_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def set_counter
    self.likes_count = 0 if likes_count.nil?
    self.comments_count = 0 if comments_count.nil?
  end

  def update_posts_count
    author.increment!(:posts_count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
