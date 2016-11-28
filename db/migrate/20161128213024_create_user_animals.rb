class CreateUserAnimals < ActiveRecord::Migration
  def change
    create_table :user_animals do |t|
      t.references :user, index: true, foreign_key: true
      t.references :animal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
