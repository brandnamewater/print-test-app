class OrdersCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    shop.with_shopify_session do
      line_items = webhook[:line_items]
      line_items.each do |item|
        variant_id = item[:variant_id]
        product_id = item[:product_id]

      # Order.new(shopify_product_id: product_id)
      Order.create(shopify_order_id: webhook[:id])
      end
    end
  end
end
