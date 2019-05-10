class StoreProduct < ApplicationRecord
  belongs_to :product

  # before_save :check_product_id
  #
  # def check_product_id
  #
  #
  # end

end
