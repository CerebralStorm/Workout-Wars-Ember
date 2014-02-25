class CreateUserExercises < ActiveRecord::Migration
  def change
    create_table :user_exercises do |t|
      t.integer :user_id
      t.integer :exercise_id

      t.timestamps
    end
    add_index :user_exercises, [:user_id, :exercise_id
  end
end
