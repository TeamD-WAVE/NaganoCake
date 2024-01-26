class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :address, presence: true
  has_many :cart_items
  has_many :orders

  def addresses
    postal_code + address + first_name + last_name
  end

 # def active_for_authentication?
  #  super && (is_active == true)
  #end
end