class AddCarModelIdToCarTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :car_model_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
