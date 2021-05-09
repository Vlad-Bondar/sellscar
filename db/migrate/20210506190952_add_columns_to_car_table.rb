class AddColumnsToCarTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :type_of_fuel, :string
    add_column :cars, :engine_volume, :float
    add_column :cars, :year_of_production, :integer
  end
end
