class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @deliveries = Delivery.where(customer: current_customer)
  end


  def log
    @cart_items = current_customer
    @order = Order.new(customer: current_customer, pay_type: params[:order][:pay_type])

    if params[:order][:address] == "basic_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address] == "registered"
      deli = Delivery.find(params[:order][:deliver_id])
      @order.postal_code = deli.postal_code
      @order.address = deli.address
      @order.name = deli.name

    elsif params[:order][:address] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @deli = "1"
    end
  end

  def create
    @order = current_customer.Orders.new(order_params)
    @order.save
    redirect_to orders_thanx_path

    if params[:order][:deli] == "1"
      current_customer.delivery.create(address_params)
    end

    @cart_items = current_cart
    @cart_items.each do |cart_item|
      OrderDetail.create(
        product: cart_item.product,
        order: @order,
        quantity: cart_item.quantity,
        sub_price: sub_price(cart_item)
      )
    end
    @cart_items.destroy_all
  end

  def thanx
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

private

  def order_params
    params.require(:order).permit(:pay_type, :total_price, :postal_code, :address, :name)
  end

end
