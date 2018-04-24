class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.references :bearer, foreign_key: true
      t.references :market_price, foreign_key: true
      t.timestamps
    end
  end
end
