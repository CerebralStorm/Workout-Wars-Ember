class CreateCompetitionJoins < ActiveRecord::Migration
  def change
    create_table :competition_joins do |t|
      t.integer :user_id
      t.integer :competition_id
      t.integer :total_experience, default: 0
      t.integer :rank

      t.timestamps
    end
  end
end
