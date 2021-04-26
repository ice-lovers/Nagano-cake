class Admins::OrdersController < ApplicationController
  
   before_action :authenticate_admin!

  def index
    #↓リンク元にパラメータを持たせてので、変数を振り分け↓
    case params[:order]
    when "customer"
      #customer_id = Rails.application.routes.recognize_path(request.referer)
      @customer = Customer.find(params[:id])
      @orders = @customer.orders
    else
      @orders = Order.all.page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
    @order_details.each do |order_detail|
      @total_price += order_detail.product.price * order_detail.quantity
    end

  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status == "入金確認"
      @order_details.update(production_status: 1)
    end
    redirect_to admins_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
