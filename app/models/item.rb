class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items

    #消費税計算
  def add_tax_price
    (self.price*1.10).round
  end
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :image, presence: true
  
end

