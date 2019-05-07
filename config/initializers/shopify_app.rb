ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "eed4283c51403d260356b30e29f11b9c"
  config.secret = "ec4d722f1339128f6aa3537d9263c243"
  config.scope = "read_orders, read_products, write_fulfillments, write_orders"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop

  config.webhooks = [
      {topic: 'app/uninstalled', address: "#{ENV['WEBHOOK_URL']}app_uninstalled", format: 'json'},
      {topic: 'orders/delete', address: "#{ENV['WEBHOOK_URL']}orders_delete", format: 'json'},
      {topic: 'orders/create', address: "#{ENV['WEBHOOK_URL']}orders_create", format: 'json'},
      {topic: 'orders/updated', address: "#{ENV['WEBHOOK_URL']}orders_updated", format: 'json'}
    ]


end
