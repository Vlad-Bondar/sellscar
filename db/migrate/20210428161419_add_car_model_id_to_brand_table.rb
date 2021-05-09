class AddCarModelIdToBrandTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :brands, :car_models, index: true
  end
end
