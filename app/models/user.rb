class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :eateries, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, presence: true

  #Create a method on User named 'owner?'
  #and return true when the User has the 'owner' role,
  #otherwise return false

  def owner?
    if @User.role === "owner"
      #debugger
      true
    else
      false
    end

  end

  #Create a method on User named 'patron?' and return true when the User has the 'patron' role,
  #otherwise return false

  def patron?
    if @User.role === "patron"
      #debugger
      true
    else
      false
    end

  end

end
