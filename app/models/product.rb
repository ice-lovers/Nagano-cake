class Product < ApplicationRecord
  belongs_to :cotegory
  has_many :cart_items
  has_many :order_details
  attachment :image
end
