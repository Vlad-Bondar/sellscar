class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :created_by
      t.integer :car_id
      t.string :small_descrition
      t.string :big_description
      t.timestamps
    end
  end
end
