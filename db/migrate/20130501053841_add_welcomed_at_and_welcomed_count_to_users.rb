class AddWelcomedAtAndWelcomedCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :welcomed_at, :timestamp

    add_column :users, :welcomed_count, :integer, :default => 0

  end
end
