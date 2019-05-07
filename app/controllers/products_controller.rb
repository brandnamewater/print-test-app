class ProductsController < ApplicationController

  def new
    shop = ShopifyAPI::Shop.current

    @product = Product.new

  end


  def create
    shop = ShopifyAPI::Shop.current

    @product = Product.new(product_params)
    new_product = ShopifyAPI::Product.new(
      :title => :title,
      :product_type => :product_type,
      :vendor => :vendor,
    )
    if @product.save
      # success! probably redirect_to some page that lists the user's products
    else
      flash[:error] = 'Unable to create product'
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :product_type, :vendor)
  end

end
