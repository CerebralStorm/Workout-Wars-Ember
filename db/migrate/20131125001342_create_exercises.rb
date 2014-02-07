class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.float :experience_multiplier
      t.integer :metric_id
      t.text :description

      t.timestamps
    end
  end
end
