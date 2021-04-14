class AddBrandIdColumnToCarTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :brand_id, :integer
  end
end
