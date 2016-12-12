class CreateParentChildren < ActiveRecord::Migration
  def change
    create_table :parent_children do |t|
      t.references :parent, index: true, foreign_key: true
      t.references :child, index: true, foreign_key: true
      t.boolean :parent_done, default: false
      t.boolean :child_done, default: false

      t.timestamps null: false
    end
  end
end
