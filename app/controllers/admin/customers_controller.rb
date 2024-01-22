 class Admin::CustomersController < ApplicationController
    
  def index
   @customers = Public::Customer.all
  end 
    
  def show
   @customer = Public::Customer.find(params[:id])
  end 
  
  def edit
   @customer = Public::Customer.find(params[:id])
  end

  def update
   @customer = Customer.find(params[:id])
   @customer.update(customer_params)
   redirect_to admin_customer_path
  end
    
  private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
    
 end