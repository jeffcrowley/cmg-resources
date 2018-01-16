class ChangeDatetimeToDateInChangeOrders < ActiveRecord::Migration[5.1]
  def change
   change_column :change_orders, :date_submitted, :date
   change_column :change_orders, :date_received, :date
  end
end
