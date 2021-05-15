ActiveAdmin.register Car do
  permit_params :drivetrain, :location, :year_of_production, :engine_volume, :transmition, :type_of_fuel, :vin, :exterior_collor, :interior_collor, :millage, :body_style, :engine, :price
end
