class AddUseTimePeriodToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :use_time_period, :boolean
  end
end
