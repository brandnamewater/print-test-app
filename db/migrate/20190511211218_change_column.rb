class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :store_products, :store_product_id, :integer, using: 'store_product_id::integer'
  end
end
