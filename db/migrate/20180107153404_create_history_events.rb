class CreateHistoryEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :history_events do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
