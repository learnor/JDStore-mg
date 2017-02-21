class AddProductIdToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :product_id, :integer
  end
end
