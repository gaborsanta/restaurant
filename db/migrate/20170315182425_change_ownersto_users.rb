class ChangeOwnerstoUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :owners, :users
    rename_column  :eateries, :owner_id, :user_id
    rename_column  :reservations, :owner_id, :user_id

  end
end
