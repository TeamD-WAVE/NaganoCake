class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!

  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  rescue ActiveRecord::RecordNotFound
     redirect_to root_path, notice: "お客様が見つかりませんでした"
  end

  def update
   @customer = current_customer
   @customer.update(customer_params)
   redirect_to '/customers/my_page'
  end

  def unsubscribe
  @customer = current_customer
  end

  def withdraw
  @customer = current_customer
  @customer.update(is_active: false)
  reset_session
  flash[:notice] = "退会処理を実行いたしました"
  redirect_to root_path
  end


 private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :password_confirmation)
  end
end
