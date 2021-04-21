class Product < ApplicationRecord
# 画像
  attachment :image

# アソシエーション 
  belongs_to :category
  has_many :cart_items
  has_many :order_details

#バリデーション  
  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :price, presence: true

end
