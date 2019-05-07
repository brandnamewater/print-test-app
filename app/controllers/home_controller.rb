class HomeController < ShopifyApp::AuthenticatedController
  def index

    shop = ShopifyAPI::Shop.current

    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @orders = ShopifyAPI::Order.find(:all, :status => 'any')
    @webhooks = ShopifyAPI::Webhook.find(:all)

    @product = ShopifyAPI::Product.new({
      :title => :title,
      :product_type => :product_type,
      :vendor => :vendor,
    })

    # f = ::ShopifyAPI::Fulfillment.new({
    #   :order_id => order_id,
    #   :location_id => location_id,
    #   :tracking_company => tracking_company,
    #   :tracking_numbers => tracking_numbers,
    #   :line_items => line_items_hash,
    # })
    # f.prefix_options = { :order_id => order_id }
    # f.save
  end

  def products
    @new_product = ShopifyAPI::Product.new({
      :title => :title,
      :product_type => :product_type,
      :vendor => :vendor,
    })
  end


  # def index
  # end
  def orders

    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    # @orders = ShopifyAPI::Order.find(:all)
    @webhooks = ShopifyAPI::Webhook.find(:all)

  end

  def orders_old

    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    # @orders = ShopifyAPI::Order.find(:all)
    @webhooks = ShopifyAPI::Webhook.find(:all)

  end

  def modal
  end

  def modal_buttons
  end

  def regular_app_page
  end

  def buttons
  end

  def help
  end

  def error
    raise "An error page"
  end

  def form_page
    if request.post?
      if params[:name].present?
        flash[:notice] = "Created #{ params[:colour] } unicorn: #{ params[:name] }."
      else
        flash[:error] = "Name must be set."
      end
    end
  end

  def pagination
    @total_pages = 3
    @page = (params[:page].presence || 1).to_i
    @previous_page = "/pagination?page=#{ @page - 1 }" if @page > 1
    @next_page = "/pagination?page=#{ @page + 1 }" if @page < @total_pages
  end


  def create
    @new_product = ShopifyAPI::Product.new(product_params)
    if @new_product.save
      # success! probably redirect_to some page that lists the user's products
    else
      flash[:error] = 'Unable to create product'
      render :new
    end
  end

  private
  def product_params
    params.fetch(:shopify_api_product, {}).permit!(:title, :product_type, :vendor)
  end

end
