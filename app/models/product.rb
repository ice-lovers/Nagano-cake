class Product < ApplicationRecord
  
  attachment :image

  belongs_to :category
  has_many :cart_items
  has_many :order_details
  
end
