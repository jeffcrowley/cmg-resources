class CreateReturns < ActiveRecord::Migration[5.1]
  def change
    create_table :returns do |t|
      t.string :jobsite_street
      t.string :jobsite_city
      t.string :jobsite_state
      t.string :jobsite_zip
      t.string :distro_center
      t.string :shipper
      t.integer :pallet_count
      t.integer :piece_count
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
