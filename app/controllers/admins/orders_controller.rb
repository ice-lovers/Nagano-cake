class Admins::OrdersController < ApplicationController

  def index
    #↓リンク元にパラメータを持たせてので、変数を振り分け↓ 
    case params[:order_sort]
    when "0"
      @customer = Customer(params[:customer_id])
      @orders = @customer.orders
    else
      @orders = Order.all.page(params[:page]).per(10)
    end 
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_order_path(@order)
  end

  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end 
  
end
