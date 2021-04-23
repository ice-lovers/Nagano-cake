class Product < ApplicationRecord
# 画像
  attachment :image

# アソシエーション 
  belongs_to :category
  has_many :cart_items
  has_many :order_details

#バリデーション
with_options presence: true do
  validates :name, length: { minimum: 1 }
  validates :detail
  validates :category_id
  validates :price, numericality: { only_integer: true }
end

end
