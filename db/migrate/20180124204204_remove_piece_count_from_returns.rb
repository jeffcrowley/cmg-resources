class RemovePieceCountFromReturns < ActiveRecord::Migration[5.1]
  def change
    remove_column :returns, :piece_count, :integer
  end
end
