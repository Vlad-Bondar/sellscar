class CreateRemoveCarIdFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :car_id
    add_column :car_models, :car_id, :integer
  end
end
