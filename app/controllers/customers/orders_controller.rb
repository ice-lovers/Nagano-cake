class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @deliveries = Delivery.where(customer_id: current_customer.id)
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
    session[:order][:pay_type] = params[:order][:pay_type]

    if params[:order][:a_method] == "0"
      session[:order][:postal_code] = current_customer.postal_code
      session[:order][:address] = current_customer.address
      session[:order][:name] = current_customer.last_name + current_customer.first_name

    elsif params[:order][:a_method] == "1"
      delivery = Delivery.find(params[:order_address])
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
    
    @cart_items.destroy_all
    
  end

  def thanx
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

private

  def order_params
    params.require(:order).permit(:pay_type, :total_price, :postal_code, :address, :name,)
  end

end
