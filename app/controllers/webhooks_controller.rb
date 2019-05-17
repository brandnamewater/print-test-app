# class WebhooksController < ShopifyApp::AuthenticatedController
#   include ShopifyApp::WebhookVerification
#   #
#   skip_before_action :verify_authenticity_token, raise: false
#
#   def orders_create
#     params.permit!
#     OrdersCreateJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
#     Order.create(shopify_order_id: id, shopify_order_name: shipping_address.first_name)
#     head :no_content
#     # shop = ShopifyAPI::Shop.current
#
#
#
#   end
#
#   private
#
#   def webhook_params
#     params.except(:controller, :action, :type)
#   end
# end
