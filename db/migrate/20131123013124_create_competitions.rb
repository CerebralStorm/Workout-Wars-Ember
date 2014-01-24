class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_participants
      t.integer :lower_level_restriction
      t.string :upper_level_restriction
      t.integer :win_condition_id
      t.integer :max_participants
      t.integer :difficulty_id
      t.boolean :is_private
      t.boolean :active, default: true
      t.integer :creator_id
      t.integer :winner_id
      t.integer :reward
      t.boolean :started, default: false

      t.timestamps
    end
  end
end
