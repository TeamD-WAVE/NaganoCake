# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    before_action :reject_customer, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  def after_sign_in_path_for(resource)
   customer_my_page_path
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
      if @customer
        if @customer.valid_password?(params[:customer][:password]) &&  (@customer.is_active == false)
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration_path
        end
      end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
   def customer_state
     customer = Customer.find_by(email: params[:customer][:email])
     return if customer.nil?
     return unless customer.valid_password?(params[:customer][:password])
   end

    def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :password_confirmation)
    end
end
