class AddWelcomedMonthPacificTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wmpt, :integer

  end
end
