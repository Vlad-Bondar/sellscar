class ChangeImagesColumnTypeToArray < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :images, 'character varying[] USING images::character varying[]'
  end
end
