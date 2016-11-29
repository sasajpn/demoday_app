class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :author
      t.integer :status

      t.timestamps null: false
    end
  end
end
