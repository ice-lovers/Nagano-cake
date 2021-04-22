class Orders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :total_price, null: false
      t.integer :delivery_charge, default: 800, null: false
      t.integer :pay_type, null: false, default: 0
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamp
    end 
  end
end
