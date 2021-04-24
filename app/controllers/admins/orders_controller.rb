class Admins::OrdersController < ApplicationController

  def index
    #↓リンク元にパラメータを持たせてので、変数を振り分け↓
    case params[:order_sort]
    when "0"
      @customer = customers_url(params[:customer_id])
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
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status == "入金確認"
      @order_details.update_all(production_status: 1)
    end
    redirect_to admins_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
