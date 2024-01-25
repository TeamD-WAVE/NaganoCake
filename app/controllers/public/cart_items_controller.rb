class Public::CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(cart_item_params)
    # @cart_item.customer_id = current_customer.id
    cart_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      #カート内に同じ商品がある場合
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path
    else
      #カート内に違う商品を追加する場合
      cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def index
    @cart_item = CartItem.all
    # @cart_item = current_customer.cart_items.all
    # byebug
  end
  
  def update
    # cart_item = current_customer.cart_items.find(params[:id])
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy_all
    # current_customer.cart_items.destroy_all
    CartItem.destroy_all
    redirect_back(fallback_location: root_path)
  end
  
   def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
   end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
