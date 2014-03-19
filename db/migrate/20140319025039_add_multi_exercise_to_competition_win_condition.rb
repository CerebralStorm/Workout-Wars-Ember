class AddMultiExerciseToCompetitionWinCondition < ActiveRecord::Migration
  def change
    add_column :competition_win_conditions, :multi_exercise, :boolean
  end
end
