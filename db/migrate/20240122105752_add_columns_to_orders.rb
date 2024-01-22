class AddColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :customer_id, :integer, null: false
    add_column :orders, :postal_code, :string, null: false
    add_column :orders, :address, :string, null: false
    add_column :orders, :name, :string, null: false
    add_column :orders, :shipping_cost, :integer, null: false
    add_column :orders, :total_payment, :integer, null: false
    add_column :orders, :payment_method, :integer, null: false
    add_column :orders, :status, :integer, null: false, default: 0
  end
end
