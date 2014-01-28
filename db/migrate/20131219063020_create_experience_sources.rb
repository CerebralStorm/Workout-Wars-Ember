class CreateExperienceSources < ActiveRecord::Migration
  def change
    create_table :experience_sources do |t|
      t.integer :amount
      t.integer :user_id
      t.belongs_to :experienceable, polymorphic: true

      t.timestamps
    end
    add_index :experience_sources, [:experienceable_id, :experienceable_type, :user_id], name: "experience_sources_index"
  end
end
