class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :total_price
      t.integer :delivery_charge
      t.integer :pay_type, default: 0
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :order_status, default: 0
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
