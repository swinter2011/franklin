class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.text :virtue
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thursday
      t.integer :friday
      t.integer :saturday
      t.integer :sunday
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :weeks, :users
    add_index :weeks, [:user_id, :created_at]
  end
end
