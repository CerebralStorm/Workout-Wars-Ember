class CreateExerciseMetrics < ActiveRecord::Migration
  def change
    create_table :exercise_metrics do |t|
      t.integer :exercise_id
      t.integer :metric_id
      t.float :experience_multiplier

      t.timestamps
    end
    add_index :exercise_metrics, [:exercise_id, :metric_id]
  end
end
