class Customers::DeliveriesController < ApplicationController

  before_action :authenticate_customer!


    def index
      @delivery = Delivery.new
      @deliveries = current_customer.deliveries
    end

    def create
      @delivery = Delivery.new(delivery_params)
      @delivery.customer_id = current_customer.id
      if @delivery.save
        redirect_to deliveries_path
        flash[:success] = "登録しました。"
      else
        @delivery = Delivery.new
        @deliveries = current_customer.deliveries
        render 'customers/deliveries/index'
      end
    end

    def destroy
      delivery = Delivery.find(params[:id])
      delivery.destroy
      redirect_to deliveries_path
    end

    def edit
      @delivery = Delivery.find(params[:id])
    end

    def update
      delivery = Delivery.find(params[:id])
      delivery.update(delivery_params)
      redirect_to deliveries_path
    end


    private

    def delivery_params
      params.require(:delivery).permit(:customer_id, :name, :postal_code, :address)
    end

end
