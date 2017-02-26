class AddOwnerIdToEateries < ActiveRecord::Migration[5.0]
  def change
    add_column :eateries, :owner_id, :integer
    add_index :eateries, :owner_id
  end
end
