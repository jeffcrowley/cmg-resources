class ChangeDatetimeToDateInRfis < ActiveRecord::Migration[5.1]
  def change
   change_column :rfis, :date_submitted, :date
   change_column :rfis, :date_answered, :date
  end
end
