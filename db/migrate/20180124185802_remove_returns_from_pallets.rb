class RemoveReturnsFromPallets < ActiveRecord::Migration[5.1]
  def change
    remove_reference :pallets, :returns, foreign_key: true
  end
end
