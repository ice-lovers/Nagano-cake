class Customers::CustomersController < ApplicationController
  before_action :set_customer
  
  def show
    
  end

  def edit
   
  end
  
  def update
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def quit
    
  end
  
  private
  def set_customer
    @customer = current_customer
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
