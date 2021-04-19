class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_id, null: false
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :price, null: false
      t.boolean :product_status, null: false, default: true
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
