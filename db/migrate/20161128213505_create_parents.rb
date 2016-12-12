class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.references :book, index: true, foreign_key: true
      t.datetime :deadline
      t.integer :status, default: 0, null: false, limit:1
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
