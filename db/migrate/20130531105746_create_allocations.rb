class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.string :values

      t.timestamps
    end
  end
end
