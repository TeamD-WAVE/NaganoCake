class Public::CustomersController < ApplicationController

  def show
   @customer = Customer.find(params[:id])
  end

  def edit
   @customer = Customer.find(params[:id])
  end

  def update
   @customer = Customer.find(params[:id])
   @customer.update(customer.params)
   redirect_to '/customers/my_page'
  end
  
  def unsubscribe
  @customer = Customer.find(params[:id])
  end
  
  def withdraw
  @customer = Customer.find(params[:id])
  @customer.update(is_active: false)
  redirect_to '/customers/my_page'
  end
  

 private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
