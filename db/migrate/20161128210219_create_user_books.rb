class CreateUserBooks < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :status
      t.boolean :parent,  null: false, default: false
      t.boolean :child,   null: false, default: false

      t.timestamps null: false
    end
  end
end
