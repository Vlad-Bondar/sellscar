class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true

  def self.comments_for_post(post_id)
    Comment.where('post_id = ? and parent_id = 0', post_id).order('id')
  end

  def self.replies_for_post(post_id)
    Comment.where('post_id = ? and parent_id != 0', post_id).order(%w[parent_id id]).group_by { |comment| comment['parent_id'] }
  end

  def self.comments_with_owner(post_id)  
    ms=[]
    Comment.comments_for_post(post_id).each do |comment|      
      ms << comment.merge(comment.user)
    end    
  end
end
