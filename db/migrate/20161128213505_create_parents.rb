class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.references :user_book, index: true, foreign_key: true
      t.date :deadline

      t.timestamps null: false
    end
  end
end
