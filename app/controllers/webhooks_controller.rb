class WebhooksController < ShopifyApp::AuthenticatedController
  include ShopifyApp::WebhookVerification
  #
  skip_before_action :verify_authenticity_token, raise: false

  def orders_create
    params.permit!
    OrdersCreateJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    Order.new(shopify_order_id: webhook[:id])
    head :no_content
    # shop = ShopifyAPI::Shop.current
  end

  # def orders_create_save
  #   Order.nwq(shopify_order_id: webook[:id])
  #
  # end

  private

  def webhook_params
    params.except(:controller, :action, :type)
  end
end
