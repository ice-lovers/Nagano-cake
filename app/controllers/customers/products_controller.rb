class Customers::ProductsController < ApplicationController

  def top
    @new_arrivals_products = Product.limit(4).order("created_at ASC")
  end

  def about
  end

  PER = 4
  def index
    @products = Product.where(product_status: "true").page(params[:page]).per(PER)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    
  end


end
