class AddAttachmentImageToEateries < ActiveRecord::Migration
  def self.up
    change_table :eateries do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :eateries, :image
  end
end
