class AddProfileDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nick_name, :string
    add_column :users, :cell_number, :string
    add_column :users, :wechat_id, :string
    add_column :users, :address, :string
  end
end
