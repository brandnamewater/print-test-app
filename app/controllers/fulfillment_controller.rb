class FulfillmentController < ApplicationController

  def fulfil_order
		if params[:order_id].present?
			service = FulfilmentService.new({
      		order_id: params[:order_id],
      		shop_url: params[:shop_url]}).set_fulfillment
		end
  end

  def fulfillment

    "https://#{@shop_session.url}/orders/#{order_id}/fulfillments.json"
  end

  def fulfill_order_2
    @shop_url = params[:shop_url]
    if params[:order_id].present?
			service = FulfilmentService.new({
      		order_id: params[:order_id],
      		shop_url: params[:shop_url]})
            begin
              tmp_shop = Shop.where(shopify_domain: @shop_url).first
              session = ShopifyAPI::Session.new(@shop_url, tmp_shop.shopify_token)
              ShopifyAPI::Base.activate_session(session)
              order = ShopifyAPI::Order.find(:order_id)
              f = ::ShopifyAPI::Fulfillment.new(
                # :order_id => reference_number,
                :order_id => order.id,

                :location_id => location_id,
                :tracking_company => tracking_company,
                :tracking_numbers => "1235",
                :line_items => line_items_hash,
              )
              f.prefix_options = { :order_id => reference_number }
              f.save
            rescue Exception => error
              puts error.backtrace
            end
    end
  end


end
