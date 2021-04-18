class Admins::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_product_path(@product.id)
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
end
