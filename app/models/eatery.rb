class Eatery < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :categories
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, presence: true
  validates :image, presence: true
  validates :address, presence: true
  validates :description, presence: true

end


