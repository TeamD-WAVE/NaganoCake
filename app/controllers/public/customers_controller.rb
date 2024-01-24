class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!, except: [:top]
 
  def show
   @customer = current_customer
  end

  def edit
   @customer = Customer.find(params[:id])
  end

  def update
   @customer = Customer.find(params[:id])
   @customer.update(customer_params)
   redirect_to '/customers/my_page'
  end

  def unsubscribe
  @customer = Customer.find(params[:id])
  end

  def withdraw
  @customer = Customer.find(params[:id])
  @customer.update(is_active: false)
  reset_session
  flash[:notice] = "退会処理を実行いたしました"
  redirect_to '/customers/my_page'
  end


 private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :password_confirmation)
  end
end
