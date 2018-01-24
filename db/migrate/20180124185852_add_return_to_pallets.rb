class AddReturnToPallets < ActiveRecord::Migration[5.1]
  def change
    add_reference :pallets, :return, foreign_key: true
  end
end
