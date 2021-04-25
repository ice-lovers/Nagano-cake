class Admins::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    flash[:success] = "制作ステータスを変更しました"
    if @order_detail.production_status == "製作中"
      @order.update(order_status: 2)
      flash[:success] = "制作ステータスを変更しました"
    elsif @order.order_details.count == @order.order_details.where(production_status: "製作完了").count
      @order.update(order_status: 3)
      flash[:success] = "制作ステータスを変更しました"
    end
      redirect_to admins_order_path(@order_detail.order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
