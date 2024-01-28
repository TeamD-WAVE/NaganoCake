class CreateOrderDerails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_derails do |t|

      t.timestamps
    end
  end
end
