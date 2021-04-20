class Customers::ProductsController < ApplicationController

  def top
  end
  
  PER = 8
  def index
    @products = Product.where(product_status: "true").page(params[:page]).per(PER)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def about
  end

end
