class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
   #小計計算
  def subtotal
    item.add_tax_price * amount
  end
end
