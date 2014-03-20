class CreateActivityValues < ActiveRecord::Migration
  def change
    create_table :activity_values do |t|
      t.integer :metric_id
      t.integer :activity_id
      t.float :value

      t.timestamps
    end
    add_index :activity_values, [:activity_id, :metric_id]
    Rake::Task['ww:activities:convert_value'].invoke 
  end
end
