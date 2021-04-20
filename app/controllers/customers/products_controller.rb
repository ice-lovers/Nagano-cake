class Customers::ProductsController < ApplicationController

  def top
  end

  def about
  end
  
  PER = 4
  def index
    @products = Product.where(product_status: "true").page(params[:page]).per(PER)
  end

end
