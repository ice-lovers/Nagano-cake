class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @deliveries = Delivery.where(customer: current_customer)
  end


  def log
    @cart_items = CartItem.where(customer: current_customer)
    session[:order] = Order.new

    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.product.price * cart_item.quantity
    end

    session[:order][:delivery_charge] = 800
    session[:order][:total_price] = @total_price
    session[:order][:order_status] = 0
    session[:order][:customer_id] = current_customer.id
    session[:order][:pay_type] = params[:order][:pay_type].to_i

    if params[:order][:a_method] == "0"
      session[:order][:postal_code] = current_customer.postal_code
      session[:order][:address] = current_customer.address
      session[:order][:name] = current_customer.last_name + current_customer.first_name

    elsif params[:order][:a_method] == "1"
      delivery = Delivery.find(params[:order][:order_address])
      session[:order][:postal_code] = delivery.postal_code
      session[:order][:address] = delivery.address
      session[:order][:name] = delivery.name

    elsif params[:order][:a_method] == "2"
      session[:order][:postal_code] = params[:order][:postal_code]
      session[:order][:address] = params[:order][:address]
      session[:order][:name] = params[:order][:name]
    end

  end

  def create
    order = Order.new(session[:order])
    order.save
    redirect_to orders_thanx_path

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.product_id = cart_item.product_id
      order_detail.quantity = cart_item.quantity
      order_detail.production_status = 0
      order_detail.price = (cart_item.product.price * 1.1).floor
      order_detail.save
    end
    @cart_items.destroy_
  end

  def thanx
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

private

  def order_params
    params.require(:order).permit(:pay_type, :total_price, :postal_code, :address, :name)
  end

end