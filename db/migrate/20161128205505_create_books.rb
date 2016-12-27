class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :author
      t.string :image
      t.integer :status
      t.integer :pid
      t.boolean :exchange, default: false

      t.timestamps null: false
    end

    add_index :books, [ :user_id, :title, :author ], unique: true
  end
end
