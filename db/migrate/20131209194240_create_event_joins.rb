class CreateEventJoins < ActiveRecord::Migration
  def change
    create_table :event_joins do |t|
      t.integer :user_id
      t.belongs_to :joinable, polymorphic: true

      t.timestamps
    end
    add_index :event_joins, [:joinable_id, :joinable_type]
  end
end
