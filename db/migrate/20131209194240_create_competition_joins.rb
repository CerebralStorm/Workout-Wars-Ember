class CreateCompetitionJoins < ActiveRecord::Migration
  def change
    create_table :competition_joins do |t|
      t.integer :user_id
      t.integer :competition_id
      t.integer :total, default: 0
      t.integer :rank

      t.timestamps
    end
    add_index :competition_joins, [:user_id, :competition_id]
  end
end
