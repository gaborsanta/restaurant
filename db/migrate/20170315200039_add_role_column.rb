class AddRoleColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string, :default => 'patron'
    #add_column :users, :role, :string, default: "patron"
  end
end
