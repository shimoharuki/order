class AddTotalToGuestOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :guest_orders, :total, :integer
  end
end
