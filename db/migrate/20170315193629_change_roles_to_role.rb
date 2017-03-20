class ChangeRolesToRole < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :roles, :string

  end
end
