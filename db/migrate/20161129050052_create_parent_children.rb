class CreateParentChildren < ActiveRecord::Migration
  def change
    create_table :parent_children do |t|
      t.references :parent, index: true, foreign_key: true
      t.references :child, index: true, foreign_key: true
      t.boolean :parent_confirm, default: false
      t.boolean :child_confirm, default: false

      t.timestamps null: false
    end
  end
end
