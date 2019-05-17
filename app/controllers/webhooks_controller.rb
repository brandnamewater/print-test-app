class WebhooksController < ShopifyApp::WebhooksController
  include ShopifyApp::WebhookVerification
  #
  skip_before_action :verify_authenticity_token, raise: false

  def orders_create
    params.permit!
    OrdersCreateJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    @order = Order.new(shopify_order_id: webhook_params[:webhook][:id])
    @order.save
    head :no_content
    # shop = ShopifyAPI::Shop.currentweb
  end

  def orders_create_save
    Order.new(shopify_order_id: webook[:id])

  end

  private

  def webhook_params
    params.except(:controller, :action, :type)
  end
end
