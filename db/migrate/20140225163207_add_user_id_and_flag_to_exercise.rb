class AddUserIdAndFlagToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :user_id, :integer
    add_column :exercises, :approved, :boolean
    add_column :challenge_attempts, :activity_id, :integer
  end
end
