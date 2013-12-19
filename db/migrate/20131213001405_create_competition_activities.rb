class CreateCompetitionActivities < ActiveRecord::Migration
  def change
    create_table :competition_activities do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :competition_id

      t.timestamps
    end
  end
end
