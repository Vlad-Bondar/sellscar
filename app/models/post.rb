$LOAD_PATH << File.join(__dir__, 'lib')
# require 'posts_method.rb'

class Post < ApplicationRecord
  has_one :car, dependent: :destroy
  has_many :comment, dependent: :destroy
  belongs_to :user

  validates :small_description, presence: :true, length: { maximum: 200 }
  validates :big_description, presence: :true
  validates_associated :car
  validates_associated :comment

  enum status: {
    archived: 0, 
    published: 1, 
    sold: 2
  }

  ratyrate_rateable "rating"

  def sort_by_params(params,posts)
    case params
    when "oldest"  
      sort_by_date_created(posts)
    when "newest" 
      sort_by_date_created_reverse(posts)
    when "expencive"  
      sort_by_price_max_to_min(posts)
    when "cheapest" 
      sort_by_price_min_to_max(posts)
    else
      posts
    end
  end

  def sort_by_price_max_to_min(posts)
    posts.sort_by { |x| x.car[:price] }.reverse
  end

  def sort_by_price_min_to_max(posts)
    posts.sort_by { |x| x.car[:price] }
  end

  def sort_by_date_created(posts)
    posts.order('created_at')
  end

  def sort_by_date_created_reverse(posts)
    posts.order('created_at').reverse
  end
end
