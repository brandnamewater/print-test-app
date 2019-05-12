class WebhooksController < ShopifyApp::AuthenticatedController

  skip_before_action :verify_authenticity_token, raise: false

  def orders_update
    shop = ShopifyAPI::Shop.current


    Order.create(shopify_order_id: id, shopify_order_name: shipping_address.first_name)
  end
end
