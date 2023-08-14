class CreateToppings < ActiveRecord::Migration[7.0]
  def change
    create_table :toppings do |t|
      t.string :plane
      t.string :sauce
      t.string :soy_sauce
      t.string :mayonnaise
      t.string :flakes
      t.string :green_seaweed

      t.timestamps
    end
  end
end
