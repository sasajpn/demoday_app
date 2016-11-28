class CreateParentWants < ActiveRecord::Migration
  def change
    create_table :parent_wants do |t|
      t.references :user_book, index: true, foreign_key: true
      t.references :parent, index: true, foreign_key: true
      t.text :recommend, limit: 140

      t.timestamps null: false
    end
  end
end
