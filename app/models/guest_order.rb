class GuestOrder < ApplicationRecord
    has_many :takoyaki_toppings, dependent: :destroy 
    has_many :takoyaki_topping_toppings, through: :takoyaki_toppings, source: :topping
end
