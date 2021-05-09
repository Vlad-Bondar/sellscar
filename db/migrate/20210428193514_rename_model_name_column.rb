class RenameModelNameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :car_models, :title, :title
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
