class AddColumnsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :postal_code, :integer
    add_column :customers, :address, :string
    add_column :customers, :phone_number, :integer
    add_column :customers, :status, :integer
  end
end
