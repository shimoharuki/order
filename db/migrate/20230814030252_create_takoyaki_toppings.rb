class CreateTakoyakiToppings < ActiveRecord::Migration[7.0]
  def change
    create_table :takoyaki_toppings do |t|
      t.references :guest_order
      t.references :topping

      t.timestamps
    end
    add_index :takoyaki_toppings, [:guest_order_id, :topping_id], unique: :true
  end
end
