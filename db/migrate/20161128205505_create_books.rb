class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :books, :title, unique: true
  end
end
