class ChangeTableNameEateriesCategories < ActiveRecord::Migration[5.0]
  def change
    rename_table :eateries_categories, :categories_eateries
  end
end
