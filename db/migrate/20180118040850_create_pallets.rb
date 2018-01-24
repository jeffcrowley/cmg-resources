class CreatePallets < ActiveRecord::Migration[5.1]
  def change
    create_table :pallets do |t|
      t.integer :piece_count
      t.references :returns, foreign_key: true

      t.timestamps
    end
  end
end
