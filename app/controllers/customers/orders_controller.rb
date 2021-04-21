class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @deliveries = Delivery.where(customer_id: current_customer.id)
  end


  def log
    @cart_items = current_cart
    @order = Order.new(customer: current_customer, pay_type: params[:order][:pay_type])
  end

  def create
  end

  def thanx
  end

private

  def order_params
    params.require(:order).permit(:pay_type, :total_price, :postal_code, :address, :name)
  end
  
end
