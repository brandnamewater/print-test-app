class Product < ApplicationRecord
  include ShopifyApp::SessionStorage

  belongs_to :shop
  # attr_accessible :vendor, :title, :product_type
end
