class AddUserIdAndFlagToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :user_id, :integer
    add_column :exercises, :custom, :boolean
  end
end
