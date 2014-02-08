class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.integer :challenge_win_condition_id
      t.integer :difficulty_id
      t.integer :metric_id
      t.integer :reward

      t.timestamps
    end
  end
end
