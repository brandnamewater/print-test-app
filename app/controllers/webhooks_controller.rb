class WebhooksController < ApplicationController

  def orders_update
    Orders.create(shopify_order_id: id, shopify_order_name: shipping_address.first_name)
  end
end
