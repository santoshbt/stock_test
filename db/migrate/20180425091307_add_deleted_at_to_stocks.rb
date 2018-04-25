class AddDeletedAtToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :deleted_at, :datetime
    add_index :stocks, :deleted_at
  end
end
