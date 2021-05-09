class RemoveColumsCarModelsId < ActiveRecord::Migration[6.0]
  def change
    remove_column :brands, :car_models_id
  end
end
