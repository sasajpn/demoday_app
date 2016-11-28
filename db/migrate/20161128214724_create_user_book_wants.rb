class CreateUserBookWants < ActiveRecord::Migration
  def change
    create_table :user_book_wants do |t|
      t.references :parent, index: true, foreign_key: true
      t.references :parent_want, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
