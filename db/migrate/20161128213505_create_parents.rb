class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.references :book, index: true, foreign_key: true
      t.date :deadline

      t.timestamps null: false
    end
  end
end
