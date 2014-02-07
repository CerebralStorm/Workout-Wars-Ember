class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :exercise_id
      t.integer :user_id
      t.float :value

      t.timestamps
    end
    add_index :activities, [:exercise_id, :user_id]
  end
end
