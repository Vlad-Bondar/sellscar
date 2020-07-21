class RenameColumnBodyCollorToBobyStyle2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :cars, :body_collor, :body_style
  end
end
