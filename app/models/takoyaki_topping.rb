class TakoyakiTopping < ApplicationRecord
  belongs_to :guest_order
  belongs_to :topping
  validates :guest_order_id, presence: true, uniqueness: { scope: :topping_id }
end
