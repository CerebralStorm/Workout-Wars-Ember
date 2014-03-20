class ConverExistingMetrics < ActiveRecord::Migration
  def change
    Rake::Task['ww:exercises:reattach_metrics'].invoke 
  end
end
