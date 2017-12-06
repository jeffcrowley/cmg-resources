class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :job_num
      t.float :original_contract_amount
      t.string :terr_manager
      t.string :created_by

      t.timestamps
    end
  end
end
