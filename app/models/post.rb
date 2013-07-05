class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :comments, order: 'created_at DESC'
  has_many :categories, :through => :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :url, presence: true

  after_validation :generate_slug

  def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end

  def generate_slug
    self.slug = self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def to_param
    self.slug
  end

end