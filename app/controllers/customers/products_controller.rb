class Customers::ProductsController < ApplicationController


  def top
    @new_arrivals_products = Product.limit(4).order("created_at ASC")
    @categories = Category.all
  end

  def about
  end

  PER = 8
  def index
    @categories = Category.all
    
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products.where(product_status: "true").page(params[:page]).per(PER) 
    else
      @products = Product.where(product_status: "true").page(params[:page]).per(PER)
    end
    
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @categories = Category.all
  end

end
