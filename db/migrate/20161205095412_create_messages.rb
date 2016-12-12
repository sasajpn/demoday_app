class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :parent_child, index: true, foreign_key: true
      t.integer :status


      t.timestamps null: false
    end
  end
end
