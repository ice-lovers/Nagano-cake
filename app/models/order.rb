class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  validates :customer_id, :total_price, :delivery_charge, :pay_type, :name, :address, :postal_code, :order_status, presence: true
  validates :total_price, :delivery_charge, numericality: { only_integer: true }

  enum pay_type: { "クレジット支払": 0, "銀行振込": 1 }
  enum order_status: { "入金待ち": 0, "入金確認": 1, "制作中":2, "発送準備":3, "発送済み":4 }
end
