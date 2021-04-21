class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @deliveries = Delivery.where(customer_id: current_customer.id)
  end

  def create
  end

  def log

  end



  def thanx
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
  end


end
