class OrderDetail < ApplicationRecord

  belongs_to :customer
  belongs_to :product

  enum order_status: { "着手不可": 0, "製作待ち": 1, "製作中":2, "製作完了":3 }

  def total_price
    price * quantity
  end

end
