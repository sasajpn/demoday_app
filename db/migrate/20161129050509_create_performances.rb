class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.integer :evaluator
      t.integer :evaluate

      t.timestamps null: false
    end
  end
end
