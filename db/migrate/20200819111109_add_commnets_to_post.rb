class AddCommnetsToPost < ActiveRecord::Migration[6.0]
  def change
    @comment1 = Comment.create post_id: 24, parent_id: 0, body: 'Greate car'
    @reply1 = Comment.create post_id: 24, parent_id: @comment1.id, body: '+1 , realy nice car'
    @reply2 = Comment.create post_id: 24, parent_id: @comment1.id, body: 'thanks guys'
  end
end
