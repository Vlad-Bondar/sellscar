class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :title
      t.timestamps
    end
    remove_column :cars, :car_name
  end
end
