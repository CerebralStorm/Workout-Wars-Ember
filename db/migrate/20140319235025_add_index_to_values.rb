class AddIndexToValues < ActiveRecord::Migration
  def up
    execute "CREATE INDEX activities_values ON activities USING GIN(values)"
  end

  def down
    execute "DROP INDEX activities_values"
  end
end
