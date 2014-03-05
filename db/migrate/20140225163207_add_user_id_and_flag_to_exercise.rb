class AddUserIdAndFlagToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :approved, :boolean
    add_column :challenge_attempts, :activity_id, :integer
    add_index :challenge_attempts, [:user_id, :challenge_id]
    drop_table :exercise_sets
    drop_table :user_exercises
  end
end
