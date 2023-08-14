class CreateGuestOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_orders do |t|
      t.string :name
      t.string :takoyaki_6s
      t.string :takoyaki_8s
      t.string :takoyaki_10s
      t.string :takoyaki_12s
      t.string :fried_takoyaki
      t.string :cold_takoyaki
      t.string :yakisoba
      t.string :yakisoba_1_half
      t.string :yakisoba_egg
      t.string :sobamesi
      t.string :beer
      t.string :happoshu

      t.timestamps
    end
  end
end
