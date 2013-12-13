class CreateEventActivities < ActiveRecord::Migration
  def change
    create_table :event_activities do |t|
      t.integer :user_id
      t.integer :activity_id
      t.belongs_to :actable, polymorphic: true

      t.timestamps
    end
    add_index :event_activities, [:actable_id, :actable_type]
  end
end
