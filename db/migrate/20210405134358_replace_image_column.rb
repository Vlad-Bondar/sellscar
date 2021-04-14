class ReplaceImageColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :images
    add_column :cars, :images, :string, default: [], array: true
  end
end
