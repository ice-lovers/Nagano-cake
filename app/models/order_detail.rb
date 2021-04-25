class OrderDetail < ApplicationRecord

  belongs_to :customer
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  enum production_status: { "着手不可": 0, "製作待ち": 1, "製作中":2, "製作完了":3 }

end
