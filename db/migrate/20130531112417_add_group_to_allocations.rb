class AddGroupToAllocations < ActiveRecord::Migration
  def change
    add_column :allocations, :group, :string

  end
end
