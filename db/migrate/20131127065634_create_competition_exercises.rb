class CreateCompetitionExercises < ActiveRecord::Migration
  def change
    create_table :competition_exercises do |t|
      t.integer :exercise_id
      t.integer :competition_id

      t.timestamps
    end
    add_index :competition_exercises, [:exercise_id, :competition_id]
  end
end
