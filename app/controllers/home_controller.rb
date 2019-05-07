class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)

    new_product = ShopifyAPI::Product.new
    new_product.title = "Burton Custom Freestlye 151"
    new_product.product_type = "Snowboard"
    new_product.vendor = "Burton"
    new_product.save
  end
end
