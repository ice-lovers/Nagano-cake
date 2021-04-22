class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
    t.integer "production_status", default: 0, null: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
  end
end
