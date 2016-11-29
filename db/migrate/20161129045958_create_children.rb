class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.references :book, index: true, foreign_key: true
      t.references :parent, index: true, foreign_key: true
      t.text :recommend

      t.timestamps null: false
    end
  end
end
