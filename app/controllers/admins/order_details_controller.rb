class Admins::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admins_order_detail_path(@order_detail)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
