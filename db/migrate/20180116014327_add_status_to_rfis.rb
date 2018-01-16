class AddStatusToRfis < ActiveRecord::Migration[5.1]
  def change
    add_column :rfis, :status, :string
  end
end
