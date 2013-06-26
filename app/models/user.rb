class User < ActiveRecord::Base
  has_many :posts, order: ('created_at DESC')
  has_many :comments, order: ('created_at DESC')

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  after_validation :generate_slug

  def generate_slug
    self.slug = self.username.gsub(/\s*[^A-Za-z0-9\.\-]\s*/, '-').downcase
  end

  def to_param
    self.slug
  end

end