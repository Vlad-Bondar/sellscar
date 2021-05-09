class AddCarModelIdToBrandTable2 < ActiveRecord::Migration[6.0]
  def change
    add_reference :car_models, :brands, index: true
  end
end
