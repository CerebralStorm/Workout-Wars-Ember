class ChangeActivitiesToUserExercises < ActiveRecord::Migration
  def change
    rename_table('activities', 'user_exercises')
    rename_table('activity_values', 'user_exercise_values')
    rename_table('competition_activities', 'competition_user_exercises')
    rename_column :user_exercise_values, :activity_id, :user_exercise_id
    rename_column :challenge_attempts, :activity_id, :user_exercise_id
    rename_column :competition_user_exercises, :activity_id, :user_exercise_id 
  end
end
