class AddCarIdColumnToCarModelTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :car_id, :integer
  end
end
