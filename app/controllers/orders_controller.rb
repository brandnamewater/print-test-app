class OrdersController < ShopifyApp::AuthenticatedController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    # @store_products = StoreProduct.all

    # @store_orders = ShopifyAPI::Order.find(params: {:line_items[:id] => @store_products.each {|store_product| store_product.store_product_id} })

    @store_orders = ShopifyAPI::Order.all

    # @match_store_orders = @store_orders.line_item.where(id: @store_products.each {|store_product| store_product.store_product_id})
    # @match_store_orders = @store_orders.find { |order| order.line_items[0]product_id == (@store_products.each {|store_product| store_product.store_product_id}) }
    # @match_store_orders = @store_orders.each do |order|
    # @match_store_orders = @store_orders.where(line_items.product_id == (@store_products.each {|store_product| store_product.store_product_id})
    # @match_store_orders = @store_orders.where("line_items --> 'product_id' == '@store_products.each {|store_product| store_product.store_product_id}' ")

    # @match_store_orders = @store_orders.each { |order| order.line_items.each { |line_item| line_item.where(product_id == @store_products.each {|store_product| store_product.store_product_id} ) } }
    # @match_store_orders = @store_orders.each do |order|
    #                         order.line_items.each do |line|
    #                           @match_orders = line.where(line.product_id == @store_products.each {|store_product| store_product.store_product_id})
    #                           # line.product_id
    #                         end
    #                       end

    store_product_ids = StoreProduct.pluck(:store_product_id)

    @store_orders.each do |order|
      line_items = order.line_items
      line_items_ids = line_items.map { |li| li.product_id}

      @common_ids = store_product_ids && line_items_ids


    end




  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end
end
