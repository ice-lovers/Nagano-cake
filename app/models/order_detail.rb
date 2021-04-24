class OrderDetail < ApplicationRecord


  belongs_to :product
  belongs_to :order

  enum order_status: { "着手不可": 0, "製作待ち": 1, "製作中":2, "製作完了":3 }

  def total_price
    price * quantity
  end

end
