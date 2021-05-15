class User < ApplicationRecord

  has_many :posts , dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable, :lockable, :recoverable, 
         :rememberable, :validatable, :confirmable
  
  acts_as_favoritor

  def favorite_posts
    posts = []
    self.all_favorites.each do |relation|
      posts.push(relation.favoritable)
    end
    posts
  end
end
