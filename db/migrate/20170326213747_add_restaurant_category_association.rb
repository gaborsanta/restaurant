class AddRestaurantCategoryAssociation < ActiveRecord::Migration[5.0]
  def change
    create_table :eateries_categories,id:false do|t|
      t.belongs_to :eatery, index:true
      t.belongs_to :category,index:true
    end
  end
end
