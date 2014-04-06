class AddDeviceTokensToUsers < ActiveRecord::Migration
  def change
    add_column :users, :device_tokens, :string, array: true
  end
end
