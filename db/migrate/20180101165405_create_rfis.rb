class CreateRfis < ActiveRecord::Migration[5.1]
  def change
    create_table :rfis do |t|
      t.string :rfi_num
      t.string :gc_rfi_num
      t.string :description
      t.datetime :date_submitted
      t.datetime :date_answered
      t.string :scope_change
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
