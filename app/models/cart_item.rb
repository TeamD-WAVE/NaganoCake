class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :amount, inclusion: { in: [1,2,3,4,5,6,7,8,9,10] }

   #小計計算
  def subtotal
    item.add_tax_price * amount
  end
end
