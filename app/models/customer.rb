class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def addresses
    postcode + address + name
  end

 # def active_for_authentication?
  #  super && (is_active == true)
  #end
end