class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.references :book, index: true, foreign_key: true
      t.references :parent, index: true, foreign_key: true
      t.text :recommend
      t.integer :status, default: 0, null: false, limit:1
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
