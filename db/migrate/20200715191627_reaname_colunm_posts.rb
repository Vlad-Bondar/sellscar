class ReanameColunmPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts , :small_descrition, :string
  end
end
