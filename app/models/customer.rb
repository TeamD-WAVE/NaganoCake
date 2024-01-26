class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :address, presence: true
  has_many :cart_items

  def addresses
    postal_code + address + name
  end

 # def active_for_authentication?
  #  super && (is_active == true)
  #end
end