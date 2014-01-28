class CreateCompetitionActivities < ActiveRecord::Migration
  def change
    create_table :competition_activities do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :competition_id

      t.timestamps
    end
    add_index :competition_activities, [:user_id, :activity_id, :competition_id], name: "competition_activities_index"
  end
end
