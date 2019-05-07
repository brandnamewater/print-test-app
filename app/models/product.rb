class Product < ApplicationRecord

  belongs_to :shop
  # attr_accessible :vendor, :title, :product_type
end
