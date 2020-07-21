class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :drivetrain
      t.string :location
      t.string :transmition
      t.string :vin
      t.string :exterior_collor
      t.string :interior_collor
      t.string :body_collor
      t.string :engine
      t.integer :millage 
      t.float  :price
      t.timestamps
    end
  end
end
