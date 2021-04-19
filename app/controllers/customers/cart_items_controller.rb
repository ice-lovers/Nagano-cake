class Customers::CartItemsController < ApplicationController

  def index
    @cart_items = Cart_item.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

end
