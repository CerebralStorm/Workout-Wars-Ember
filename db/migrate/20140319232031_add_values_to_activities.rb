class AddValuesToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :values, :hstore 
    Rake::Task['ww:activities:convert_value'].invoke 
    remove_column :activities, :value
  end
end
