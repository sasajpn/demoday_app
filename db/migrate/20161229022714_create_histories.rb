class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :book, index: true, foreign_key: true
      t.references :prefecture, index: true, foreign_key: true
      t.integer :exchange_id

      t.timestamps null: false
    end
  end
end
