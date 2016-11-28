class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.references :user_book, index: true, foreign_key: true
      t.date :start_day

      t.timestamps null: false
    end
  end
end
