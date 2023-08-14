class Topping < ApplicationRecord
    has_many :takoyaki_toppings, dependent: :destroy
end
