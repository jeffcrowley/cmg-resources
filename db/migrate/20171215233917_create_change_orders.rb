class CreateChangeOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :change_orders do |t|
      t.string :co_num
      t.string :gc_co_num
      t.string :name
      t.datetime :date_submitted
      t.datetime :date_received
      t.float :initial_co_value
      t.float :labor_value
      t.float :approved_co_value
      t.string :status
      t.text :notes
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
