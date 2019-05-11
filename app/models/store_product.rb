class StoreProduct < ApplicationRecord
  belongs_to :product

  # before_save :check_product_id
  #
  # def check_product_id
  #   begin
  #     self.store_product_id = @store_product.store_product_id
  #   end while self.class.find_by(store_product_id: store_product_id)
  # end 

end
