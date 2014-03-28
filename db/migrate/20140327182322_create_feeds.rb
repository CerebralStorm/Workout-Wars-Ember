class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :feedable, polymorphic: true
      t.text :description
      t.timestamps
    end
  end
end
