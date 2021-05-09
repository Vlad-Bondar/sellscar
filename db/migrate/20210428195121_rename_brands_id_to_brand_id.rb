class RenameBrandsIdToBrandId < ActiveRecord::Migration[6.0]
  def change
    rename_column :car_models, :brands_id, :brand_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
