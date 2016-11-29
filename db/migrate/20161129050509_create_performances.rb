class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :evaluate
      t.text :comment

      t.timestamps null: false
    end
  end
end
