class CreateCompetitionWinConditions < ActiveRecord::Migration
  def change
    create_table :competition_win_conditions do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
