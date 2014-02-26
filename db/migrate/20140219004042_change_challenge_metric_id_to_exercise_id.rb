class ChangeChallengeMetricIdToExerciseId < ActiveRecord::Migration
  def change
    rename_column :challenges, :metric_id, :exercise_id
  end
end
