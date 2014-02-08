class CreateChallengeAttempts < ActiveRecord::Migration
  def change
    create_table :challenge_attempts do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.float :result

      t.timestamps
    end
  end
end
