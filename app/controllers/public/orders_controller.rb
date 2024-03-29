class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :caritem_nill, only: [:new, :create]

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
      # @total = @order.inject(0) { |sum, order.car_item| sum + car_item.subtotal }
  end

  def create
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save
    end

    CartItem.destroy_all
    redirect_to orders_thanks_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc).page(params[:page])
  end

  def show
    if params[:id] == 'confirm'
      # 'confirm' の場合のエラー処理や代替処理を行う
      # 例: flashメッセージを設定してリダイレクトする
      flash[:error] = 'Invalid order ID'
      redirect_to request.referer
    else
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: @order.id)
    end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :customer_id , :status)
  end

  def caritem_nill
    cart_items = current_customer.cart_items
    if cart_items.blank?
      redirect_to cart_items_path
    end
  end
end