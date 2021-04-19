class Admins::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @oreder = Order.find(params[:id])
  end

  def update
  end

end
