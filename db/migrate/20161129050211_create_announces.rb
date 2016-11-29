class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.references :book, index: true, foreign_key: true
      t.date :start_dat

      t.timestamps null: false
    end
  end
end
