class ChangeTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :post_id, :integer
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")

    remove_column :posts, :car_id
  end
end
