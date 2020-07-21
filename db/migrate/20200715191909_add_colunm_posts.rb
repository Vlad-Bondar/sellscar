class AddColunmPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :small_description, :string  
  end
end
