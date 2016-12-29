class CreateEvaluates < ActiveRecord::Migration
  def change
    create_table :evaluates do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :evaluator
      t.integer :level

      t.timestamps null: false
    end
  end
end
