class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  # has_many :products
  has_many :store_products
end
